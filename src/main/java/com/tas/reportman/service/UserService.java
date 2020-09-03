package com.tas.reportman.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.tas.reportman.entity.User;
import com.tas.reportman.user.CrmUser;



public interface UserService extends UserDetailsService {
	
	public User findByUserName(String userName);

	User findByUserEmail(String email);

	public void save(@Valid CrmUser theCrmUser);

	public User findByUserId(int id);

	public List<User> getAllEmps();

	public Boolean checkEditValidation(@Valid CrmUser theCrmUser);

	public Boolean checkIfUserInfoChanged(@Valid CrmUser theCrmUser);
	
	public UserDetails getUserDetails();

	public List<User> getAllUsers();

}
