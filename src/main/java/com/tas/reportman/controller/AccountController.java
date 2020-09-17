package com.tas.reportman.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tas.reportman.entity.Role;
import com.tas.reportman.entity.User;
import com.tas.reportman.form.AccountEditForm;
import com.tas.reportman.form.PasswordEditForm;
import com.tas.reportman.service.UserService;
import com.tas.reportman.user.CrmUser;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired 
	UserService userService;
	
	@GetMapping("/new")
	public String showAccountCreateNewForm(ModelMap model) {
		
			
		List<String> roles = new ArrayList<String>();
		roles.add("EMPLOYEE");
		
		model.addAttribute("crmUser", new CrmUser());
		model.addAttribute("roles", roles);
		
		return "account_new";		
	}
	
	@PostMapping("/new/processing")
	public String newProcessing(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, 
							BindingResult theBindingResult, 
							Model theModel) {
		List<String> roles = new ArrayList<>();
		roles.add("EMPLOYEE");
		
		// form validation
		 if (theBindingResult.hasErrors()){		
			theModel.addAttribute("roles", roles);
			theModel.addAttribute("registrationError", "Missing required value or invalid input");
			return "account_new";
	    }
		 
		 if (theCrmUser.getRoles().size() <= 0){
				theModel.addAttribute("roles", roles);
				theModel.addAttribute("crmUser", theCrmUser);
				theModel.addAttribute("registrationError", "Missing required value or invalid input");
		    	return "account_new";
		}
	
		// check the database if user name or email already exists
	    User existing1 = userService.findByUserName(theCrmUser.getUserName());
	    User existing2 = userService.findByUserEmail(theCrmUser.getEmail());
	        
	    if (existing1 != null || existing2 != null){
			theModel.addAttribute("roles", roles);
			theModel.addAttribute("crmUser", theCrmUser);
			theModel.addAttribute("registrationError", "User name or email already exists.");
	    	return "account_new";
	    }
	 	// create user account        						
	    userService.save(theCrmUser);
	    
	    theModel.addAttribute("roles", roles);
		theModel.addAttribute("crmUser", new CrmUser());
		theModel.addAttribute("successMessage", "Account's been created successfully");
	    	    
	    return "account_new";		
	}
	
	@GetMapping("/create")
	public String showRegistrationForm(ModelMap model) {
		
			
		List<String> roles = new ArrayList<String>();
		roles.add("EMPLOYEE");
		roles.add("MANAGER");
		roles.add("ADMIN");
		
		model.addAttribute("crmUser", new CrmUser());
		model.addAttribute("roles", roles);
		
		return "account_create";		
	}

	@PostMapping("/create/processing")
	public String processing(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, 
							BindingResult theBindingResult, 
							Model theModel) {
		// form validation
		 if (theBindingResult.hasErrors()){
			List<String> roles = new ArrayList<>();
			roles.add("EMPLOYEE");
			roles.add("MANAGER");
			roles.add("ADMIN");
			theModel.addAttribute("roles", roles);
			theModel.addAttribute("registrationError", "Missing required value or invalid input");
			return "account_create";
	    }
		 
		 if (theCrmUser.getRoles().size() <= 0){
		    	List<String> roles = new ArrayList<String>();
		    	roles.add("EMPLOYEE");
				roles.add("MANAGER");
				roles.add("ADMIN");
				theModel.addAttribute("roles", roles);
				theModel.addAttribute("crmUser", theCrmUser);
				theModel.addAttribute("registrationError", "Missing required value or invalid input");
		    	return "account_create";
		}
	
		// check the database if user name or email already exists
	    User existing1 = userService.findByUserName(theCrmUser.getUserName());
	    User existing2 = userService.findByUserEmail(theCrmUser.getEmail());
	        
	    if (existing1 != null || existing2 != null){
	    	List<String> roles = new ArrayList<String>();
	    	roles.add("EMPLOYEE");
			roles.add("MANAGER");
			roles.add("ADMIN");
			theModel.addAttribute("roles", roles);
			theModel.addAttribute("crmUser", theCrmUser);
			theModel.addAttribute("registrationError", "User name or email already exists.");
	    	return "account_create";
	    }
	 	// create user account        						
	    userService.save(theCrmUser);
	    	    
	    return "account_create_success";		
	}
	
	@GetMapping("/edit")
	public String showEditPage(ModelMap model, 
							@RequestParam("id") int id) {
		
		User user = userService.findByUserId(id);
		
		AccountEditForm theUser = new AccountEditForm();
		theUser.setId(user.getId());
		theUser.setUserName(user.getUserName());
		theUser.setFirstName(user.getFirstName());
		theUser.setLastName(user.getLastName());
		theUser.setEmail(user.getEmail());
		List<Role> userRoles = user.getRoles();
		
		for (Role role:userRoles) {
			if (role.getName().equals("ROLE_EMPLOYEE")) {
				theUser.addRole("EMPLOYEE");
			} else if (role.getName().equals("ROLE_MANAGER")) {
				theUser.addRole("MANAGER");
			} else if (role.getName().equals("ROLE_ADMIN")) {
				theUser.addRole("ADMIN");
			}
		}
				
		List<String> roles = new ArrayList<String>();
		roles.add("EMPLOYEE");
		roles.add("MANAGER");
		roles.add("ADMIN");
		
		UserDetails userDetails = userService.getUserDetails();
		model.addAttribute("authentication",userDetails.getAuthorities());
				
		model.addAttribute("crmUser", theUser);
		model.addAttribute("roles", roles);
		
		return "account_edit";		
		
	}
	
	@PostMapping("/edit/processing")
	public String editing(@Valid @ModelAttribute("crmUser") AccountEditForm theCrmUser, 
							BindingResult theBindingResult, 
							Model theModel) {
		// form validation
		if (theBindingResult.hasErrors()){
			List<String> roles = new ArrayList<>();
			roles.add("EMPLOYEE");
			roles.add("MANAGER");
			roles.add("ADMIN");
			theModel.addAttribute("roles", roles);
			UserDetails userDetails = userService.getUserDetails();
			theModel.addAttribute("authentication",userDetails.getAuthorities());
			return "account_edit";
	    }
		
		Boolean result = userService.checkEditValidation(theCrmUser);
		
		// check user name and email 	        
	    if (!result) {
	    	List<String> roles = new ArrayList<String>();
	    	roles.add("EMPLOYEE");
			roles.add("MANAGER");
			roles.add("ADMIN");
			theModel.addAttribute("roles", roles);
			theModel.addAttribute("crmUser", theCrmUser);
			theModel.addAttribute("registrationError", "User name or email already exists.");
			UserDetails userDetails = userService.getUserDetails();
			theModel.addAttribute("authentication",userDetails.getAuthorities());
	    	return "account_edit";
	    }   

	 	// create user account        						
	    userService.edit(theCrmUser);
	    	    
	    return "account_create_success";		
	}
	
	@GetMapping("/password/edit")
	public String showPasswordEditPage(ModelMap model, 
									   @RequestParam("id") int id) {
		
		User user = userService.findByUserId(id);
		
		PasswordEditForm theUser = new PasswordEditForm();
		theUser.setId(user.getId());
					
		model.addAttribute("crmUser", theUser);
		
		return "account_password_edit";		
		
	}
	
	@PostMapping("/password/edit/processing")
	public String passwordEditProcessing(@Valid @ModelAttribute("crmUser") PasswordEditForm theCrmUser, 
										BindingResult theBindingResult, 
										Model model) {
		// check validation
		if (theBindingResult.hasErrors()) {			
			model.addAttribute("crmUser", theCrmUser);
			return "account_password_edit";
	    }
		
		// check if current password is correct
		if (userService.checkIfPasswordMatch(theCrmUser.getId(), theCrmUser.getCurrentPassword())) {
			
			// check if new password is different from current password
			if (userService.checkIfPasswordMatch(theCrmUser.getId(), theCrmUser.getNewPassword())) {
				model.addAttribute("crmUser", theCrmUser);
				model.addAttribute("errorMessage", "New password must be different from current password");
				return "account_password_edit";	
			}
			
			userService.editPassword(theCrmUser);
			model.addAttribute("crmUser", theCrmUser);
			model.addAttribute("successMessage", "Password's been successfully updated");
			return "account_password_edit";	
		} else {
			model.addAttribute("crmUser", theCrmUser);
			model.addAttribute("errorMessage", "Incorrect current password");
			return "account_password_edit";	
		}		
	}
		
	@GetMapping("/list")
	public String showAccountList(ModelMap model) {
		List<User> users = userService.getAllUsers();
		
		model.addAttribute("users", users);
		return "account_list";
	}
	
	@GetMapping("/find")
	public String showAccount(ModelMap model,
								@RequestParam("userName") String userName) {
		User user = userService.findByUserName(userName);
		List<User> users = new ArrayList<User>();
		
		if (user != null) {
			users.add(user);
		} else {
			model.addAttribute("message", "お探しのユーザーが見つかりません。");
		}
		
		model.addAttribute("users", users);
		return "account_list";
	}
	
}
