package com.tas.reportman.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.Role;
import com.tas.reportman.entity.User;
import com.tas.reportman.entity.UserReportReadStatus;
import com.tas.reportman.form.AccountEditForm;
import com.tas.reportman.form.PasswordEditForm;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private EntityManager entityManager;
	
	private ReportDao reportDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public void setReportDao(@Lazy ReportDao reportDao) {
		this.reportDao = reportDao;
	}

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
		
		// check role
		List<Role> roles = theUser.getRoles();
		Boolean isEmployee = false;
		for (Role role : roles) {
			if (role.getId() == 1) {
				isEmployee = true;
			}
		}
		
		
		// get all reports
		List<Report> reports = reportDao.getAll();
		if (reports.size() > 0 && reports != null && !isEmployee) {
			for (Report report:reports) {
				UserReportReadStatus userReportReadStatus = new UserReportReadStatus(theUser, report, false);
				report.addUserReportReadSatus(userReportReadStatus);
				theUser.addUserReportReadSatus(userReportReadStatus);
				currentSession.saveOrUpdate(report);
				currentSession.saveOrUpdate(theUser);
				currentSession.saveOrUpdate(userReportReadStatus);	
			}
		} else {
			currentSession.saveOrUpdate(theUser);
		}
		
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

	@Override
	public void edit(@Valid AccountEditForm theCrmUser) {
		// get current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.clear();
		
		// get user
		User user = currentSession.get(User.class, theCrmUser.getId());
		
		// edit user
		user.setUserName(theCrmUser.getUserName());
		user.setFirstName(theCrmUser.getFirstName());
		user.setLastName(theCrmUser.getLastName());
		user.setEmail(theCrmUser.getEmail());
		
		List<String> roles = theCrmUser.getRoles();
		
		List<Role> theRoles = new ArrayList<Role>();
		
		for (String role:roles) {
			theRoles.add(roleDao.findRoleByName("ROLE_"+role));
		}
		
		// give user default role of "employee"
		user.setRoles(theRoles);
		
		// update to database
		currentSession.saveOrUpdate(user);
		
	}

	@Override
	public void editPassword(@Valid PasswordEditForm theCrmUser) {
		
		// get current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		currentSession.clear();
		
		// get user
		User user = currentSession.get(User.class, theCrmUser.getId());
		
		// edit user password
		user.setPassword(passwordEncoder.encode(theCrmUser.getNewPassword()));
		
		// update to database
		currentSession.saveOrUpdate(user);
	}

}
