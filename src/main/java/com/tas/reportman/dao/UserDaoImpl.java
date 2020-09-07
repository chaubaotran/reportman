package com.tas.reportman.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tas.reportman.entity.Role;
import com.tas.reportman.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private EntityManager entityManager;

	@Override
	public User findByUserName(String theUserName) {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);

		// now retrieve/read from database using username
		Query<User> theQuery = currentSession.createQuery("from User where userName=:uName", User.class);
		theQuery.setParameter("uName", theUserName);
		User theUser = null;
		try {
			theUser = theQuery.getSingleResult();
		} catch (Exception e) {
			theUser = null;
		}

		return theUser;
	}

	@Override
	public void save(User theUser) {
		// get current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.clear();

		// create the user ... finally LOL
		currentSession.saveOrUpdate(theUser);
	}

	@Override
	public User findByUserEmail(String email) {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);

		// now retrieve/read from database using username
		Query<User> theQuery = currentSession.createQuery("from User where email=:uEmail", User.class);
		theQuery.setParameter("uEmail", email);
		User theUser = null;
		try {
			theUser = theQuery.getSingleResult();
		} catch (Exception e) {
			theUser = null;
		}

		return theUser;
	}

	@Override
	public User findByUserId(int id) {
		// get current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		User user = currentSession.get(User.class, id);
		
		return user;
	}

	@Override
	public List<User> getAllEmps() {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		// retrieve from db user with role employee
		Query<User> theQuery = currentSession.createQuery("select u from User u WHERE :element in elements(u.roles)", User.class);
		theQuery.setParameter("element", currentSession.get(Role.class, 1));
		List<User> theUsers = null;
		try {
			theUsers = theQuery.getResultList();
		} catch (Exception e) {
			theUsers = null;
		}

		return theUsers;
	}
	
	@Override
	public List<User> getAllAdsAndMans() {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		// retrieve from db user with role employee
		Query<User> theQuery = currentSession.createQuery("select u from User u WHERE :element not in elements(u.roles)", User.class);
		theQuery.setParameter("element", currentSession.get(Role.class, 1));
		List<User> theUsers = null;
		try {
			theUsers = theQuery.getResultList();
		} catch (Exception e) {
			theUsers = null;
		}

		return theUsers;
	}

	@Override
	public List<User> getAllUsers() {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		// retrieve from db user with role employee
		Query<User> theQuery = currentSession.createQuery("from User order by userName", User.class);
		
		List<User> theUsers = null;
		try {
			theUsers = theQuery.getResultList();
		} catch (Exception e) {
			theUsers = null;
		}

		return theUsers;
	}
	
	@Override
	public User getUser(int id) {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		User user;

		try {
			user = currentSession.get(User.class, id);
		} catch (Exception e) {
			user = null;
		}

		return user;
	}

}
