package com.tas.reportman.dao;

import java.util.List;

import javax.validation.Valid;

import com.tas.reportman.entity.User;
import com.tas.reportman.form.AccountEditForm;
import com.tas.reportman.form.PasswordEditForm;

public interface UserDao {

	public User findByUserName(String userName);
    
    public void save(User user);

	public User findByUserEmail(String email);

	public User findByUserId(int id);

	public List<User> getAllEmps();

	public List<User> getAllUsers();

	public List<User> getAllAdsAndMans();

	public User getUser(int id);

	public void edit(@Valid AccountEditForm theCrmUser);

	public void editPassword(@Valid PasswordEditForm theCrmUser);
}
