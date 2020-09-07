package com.tas.reportman.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.User;
import com.tas.reportman.entity.UserReportReadStatus;

@Repository
public class UserReportReadStatusDaoImpl implements UserReportReadStatusDao {
	
	@Autowired
	private EntityManager entityManager;
	
	@Autowired
	private ReportDao reportDao;
	
	@Autowired
	private UserDao userDao;

	@Override
	public List<Report> getUnreadReports(int empId, int managerId) {		
		
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		// get all Reports of empId
		List<Report> reports = reportDao.getAllReports(empId);
		
		// get the manager
		User user = userDao.getUser(managerId);
		
		List<Report> unReadReports = new ArrayList<Report>();
		Query<Report> theQuery = currentSession.createQuery("select distinct u.report from UserReportReadStatus u where u.report in (:reports) and u.user = :user and u.read = :read", Report.class);
		theQuery.setParameter("user", user);
		theQuery.setParameter("reports", reports);
		theQuery.setParameter("read", false);
		try {
			unReadReports = theQuery.getResultList();
		} catch (Exception e) {
			unReadReports = null;
		}	
		return unReadReports;

	}

	@Override
	public void confirmReadReport(int reportId, int userId) {
		// get the current hibernate session
		Session currentSession = entityManager.unwrap(Session.class);
		
		// get report
		Report report = reportDao.getReport(reportId);
		
		// get User
		User user = userDao.getUser(userId);
		
		UserReportReadStatus userReportReadStatus;
		
		Query<UserReportReadStatus> theQuery = currentSession.createQuery("from UserReportReadStatus u where u.report = :report and u.user = :user", UserReportReadStatus.class);
		theQuery.setParameter("user", user);
		theQuery.setParameter("report", report);
		
		try {
			userReportReadStatus = theQuery.getSingleResult();
		} catch (Exception e) {
			userReportReadStatus = null;
		}	
		userReportReadStatus.setRead(true);
		
		currentSession.saveOrUpdate(userReportReadStatus);

	}

}
