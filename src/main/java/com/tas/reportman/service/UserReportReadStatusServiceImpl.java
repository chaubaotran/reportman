package com.tas.reportman.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tas.reportman.dao.UserReportReadStatusDao;
import com.tas.reportman.entity.Report;

@Service
public class UserReportReadStatusServiceImpl implements UserReportReadService {
	
	@Autowired
	UserReportReadStatusDao userReportReadStatusDao;

	@Override
	@Transactional
	public List<Report> getUnreadReports(int empId, int managerId) {
		return userReportReadStatusDao.getUnreadReports(empId, managerId);
	}

	@Override
	@Transactional
	public void confirmReadReport(int reportId, int userId) {
		userReportReadStatusDao.confirmReadReport(reportId, userId);		
	}

}
