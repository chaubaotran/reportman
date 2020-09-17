package com.tas.reportman.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tas.reportman.dao.RoleDao;
import com.tas.reportman.dao.UserDao;
import com.tas.reportman.entity.Role;
import com.tas.reportman.entity.User;
import com.tas.reportman.form.AccountEditForm;
import com.tas.reportman.form.PasswordEditForm;
import com.tas.reportman.user.CrmUser;

@Service
public class UserServiceImpl implements UserService {

	// need to inject user dao
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public User findByUserName(String userName) {
		// check the database if the user already exists
		return userDao.findByUserName(userName);
	}
	
	@Override
	@Transactional
	public User findByUserEmail(String email) {
		// check the database if the user already exists
		return userDao.findByUserEmail(email);
	}

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = userDao.findByUserEmail(email);
		if (user == null) {
			throw new UsernameNotFoundException("Not found");
		}
		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
				mapRolesToAuthorities(user.getRoles()));
	}

	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}

	@Override
	@Transactional
	public void save(@Valid CrmUser crmUser) {
		User user = new User();
		// assign user details to the user object
		if(crmUser.getId() != 0) {
			user.setId(crmUser.getId());
		}
		
		user.setUserName(crmUser.getUserName());
		user.setPassword(passwordEncoder.encode(crmUser.getPassword()));
		user.setFirstName(crmUser.getFirstName());
		user.setLastName(crmUser.getLastName());
		user.setEmail(crmUser.getEmail());
		
		List<String> roles = crmUser.getRoles();
		
		List<Role> theRoles = new ArrayList<Role>();
		
		for (String role:roles) {
			theRoles.add(roleDao.findRoleByName("ROLE_"+role));
		}
		
		// give user default role of "employee"
		user.setRoles(theRoles);

		 // save user in the database
		userDao.save(user);
		
	}

	@Override
	@Transactional
	public User findByUserId(int id) {
		return userDao.findByUserId(id);
	}

	@Override
	@Transactional
	public List<User> getAllEmps() {
		return userDao.getAllEmps();
	}

	@Override
	@Transactional
	public Boolean checkEditValidation(AccountEditForm theCrmUser) {
		User existing1 = userDao.findByUserName(theCrmUser.getUserName());
	    User existing2 = userDao.findByUserEmail(theCrmUser.getEmail());
	        
	    if ((existing1 != null && existing1.getId() != theCrmUser.getId()) || (existing2 != null && existing2.getId() != theCrmUser.getId())) {
	    	return false;
	    }
		return true;
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDao.getAllUsers();
	}

	@Override
	@Transactional
	public void edit(@Valid AccountEditForm theCrmUser) {

		userDao.edit(theCrmUser);
		
	} 
	
	public UserDetails getUserDetails() {
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userDetails;
	}

	@Override
	public Boolean checkIfPasswordMatch(int id, String currentPassword) {
		User user = userDao.getUser(id);
		return (passwordEncoder.matches(currentPassword, user.getPassword()));
	}

	@Override
	@Transactional
	public void editPassword(@Valid PasswordEditForm theCrmUser) {
		userDao.editPassword(theCrmUser);
		
	}

}


