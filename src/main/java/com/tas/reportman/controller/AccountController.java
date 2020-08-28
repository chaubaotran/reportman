package com.tas.reportman.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tas.reportman.entity.User;
import com.tas.reportman.service.UserService;
import com.tas.reportman.user.CrmUser;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired 
	UserService userService;
	
	@GetMapping("/create")
	public String showRegistrationForm(ModelMap model) {
		
		List<String> roles = new ArrayList<String>();
		roles.add("EMPLOYEE");
		roles.add("MANAGER");
		roles.add("ADMIN");
		
		model.addAttribute("crmUser", new CrmUser());
		model.addAttribute("roles", roles);
		
		return "account-create";		
	}

	@PostMapping("/create/processing")
	public String processing(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser, 
							BindingResult theBindingResult, 
							Model theModel) {
	// form validation
	 if (theBindingResult.hasErrors()){
		 System.out.println("in error");
		List<String> roles = new ArrayList<>();
		roles.add("EMPLOYEE");
		roles.add("MANAGER");
		roles.add("ADMIN");
		theModel.addAttribute("roles", roles);
		return "account-create";
    }

	String userName = theCrmUser.getUserName();
	
	// check the database if user already exists
    User existing = userService.findByUserName(userName);
        
    if (existing != null){
    	System.out.println("in existing");
    	List<String> roles = new ArrayList<String>();
    	roles.add("EMPLOYEE");
		roles.add("MANAGER");
		roles.add("ADMIN");
		theModel.addAttribute("roles", roles);
    	theModel.addAttribute("crmUser", new CrmUser());
		theModel.addAttribute("registrationError", "User name already exists.");
    	return "account-create";
    }
	 	// create user account        						
	    userService.save(theCrmUser);
	    	    
	    return "account-create-success";		
	}
	
//	@GetMapping("/edit")
//	public String showEditPage(ModelMap model, @RequestParam("id") long id) {
//		
//		User user = userService.findByUserId(id);
//		
//		CrmUser theUser = new CrmUser();
//		theUser.setId(user.getId());
//		theUser.setUserName(user.getUserName());
//		theUser.setFirstName(user.getFirstName());
//		theUser.setLastName(user.getLastName());
//		theUser.setEmail(user.getEmail());
//		theUser.setPassword(user.getPassword());
//		theUser.setMatchingPassword(user.getPassword());	
//		theUser.setRoles(user.getRoles());
//		
//		List<String> roles = new ArrayList<String>();
//		roles.add("ROLE_EMPLOYEE");
//		roles.add("ROLE_MANAGER");
//		roles.add("ROLE_ADMIN");
//				
//		model.addAttribute("crmUser", theUser);
//		model.addAttribute("roles", roles);
//		
//		return "account-create";		
//		
//	}

}
