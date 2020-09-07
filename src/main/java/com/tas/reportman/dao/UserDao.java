package com.tas.reportman.dao;

import java.util.List;

import com.tas.reportman.entity.User;

public interface UserDao {

	public User findByUserName(String userName);
    
    public void save(User user);

	public User findByUserEmail(String email);

	public User findByUserId(int id);

	public List<User> getAllEmps();

	public List<User> getAllUsers();

	List<User> getAllAdsAndMans();

	User getUser(int id);
}
