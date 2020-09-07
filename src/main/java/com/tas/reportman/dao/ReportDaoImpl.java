package com.tas.reportman.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.User;
import com.tas.reportman.entity.UserReportReadStatus;

@Repository
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	UserDao userDao;

	@Override
	public List<Report> getAllReports(int id) {
		
		Session session = entityManager.unwrap(Session.class);
		
		User user = session.get(User.class, id);
		
		Query<Report> theQuery = session.createQuery("FROM Report WHERE user = :theUser ORDER BY DATE DESC", Report.class);
		theQuery.setParameter("theUser", user);
		
		List<Report> reports;
		
		try {
			reports = theQuery.getResultList();
		} catch (Exception e){
			reports = null;
		}
		
		return reports;
	}

	@Override
	public Report getReport(int id) {
		Session session = entityManager.unwrap(Session.class);
		Report theReport;
		try {
			theReport = (Report)session.get(Report.class, id);		
		} catch (Exception e) {
			theReport = null;
		}
		return theReport;
	}

	@Override
	public void saveOrUpdateReport(Report report, int userId) {
		Session session = entityManager.unwrap(Session.class);
		
		User user = session.get(User.class, userId);		
		user.add(report);			
		
		List<User> users = userDao.getAllAdsAndMans();
		
		for (User u:users) {
			UserReportReadStatus userReportReadStatus = new UserReportReadStatus(u, report, false);
			report.addUserReportReadSatus(userReportReadStatus);
			u.addUserReportReadSatus(userReportReadStatus);
			session.saveOrUpdate(report);
			session.saveOrUpdate(u);
			session.saveOrUpdate(userReportReadStatus);	
		}
	}

	@Override
	public List<Report> getFilteredReports(String year, String month, int id) {
		Session session = entityManager.unwrap(Session.class);
		
		User user = session.get(User.class, id);
		
		Query<Report> theQuery = session.createQuery("FROM Report WHERE date LIKE :date AND user = :theUser ORDER BY date DESC ", Report.class);
		theQuery.setParameter("theUser", user);
		
		if (year == "None" || year == null || month == "None" || month == null) {	
			return null;					
		} else if (year != "None" && year != null && month != "None" && month != null) {
			theQuery.setParameter("date", year + "-" + month + "-" + "%");	
		}
		
		List<Report> reports;
		
		try {
			reports = theQuery.getResultList();
		} catch (Exception e){
			reports = null;
		}
		
		return reports;
	}

	@Override
	public Boolean checkIfReportDateUnique(@Valid Report theReport, int id) {
		Session session = entityManager.unwrap(Session.class);
		
		User user = session.get(User.class, id);
		
		Query<Report> theQuery = session.createQuery("FROM Report WHERE date = :date AND user = :theUser ORDER BY date DESC ", Report.class);
		theQuery.setParameter("theUser", user);
		theQuery.setParameter("date", theReport.getDate());
		
		Report existing;
		
		try {
			existing = theQuery.getSingleResult();
		} catch (Exception e) {
			existing = null;
		}
		
		if (existing == null) {
			return true;		
		}		
		return false;
	}

}
