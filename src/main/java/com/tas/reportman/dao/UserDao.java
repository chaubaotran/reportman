package com.tas.reportman.dao;

import java.util.List;

import com.tas.reportman.entity.User;

public interface UserDao {

	public User findByUserName(String userName);
    
    public void save(User user);

	public User findByUserEmail(String email);

	public User findByUserId(long id);

	public List<User> getAllEmps();
}
