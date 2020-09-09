package com.tas.reportman.service;

import java.util.List;
import javax.validation.Valid;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.tas.reportman.entity.User;
import com.tas.reportman.form.AccountEditForm;
import com.tas.reportman.form.PasswordEditForm;
import com.tas.reportman.user.CrmUser;



public interface UserService extends UserDetailsService {
	
	public User findByUserName(String userName);

	public User findByUserEmail(String email);

	public void save(@Valid CrmUser theCrmUser);

	public User findByUserId(int id);

	public List<User> getAllEmps();

	public Boolean checkEditValidation(AccountEditForm theCrmUser);
	
	public UserDetails getUserDetails();

	public List<User> getAllUsers();

	public void edit(@Valid AccountEditForm theCrmUser);

	public Boolean checkIfPasswordMatch(int id, String currentPassword);

	public void editPassword(@Valid PasswordEditForm theCrmUser);

}
