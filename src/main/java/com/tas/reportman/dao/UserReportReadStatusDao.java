package com.tas.reportman.dao;

import java.util.List;

import com.tas.reportman.entity.Report;

public interface UserReportReadStatusDao {

	public List<Report> getUnreadReports(int empId, int managerId);

	public void confirmReadReport(int reportId, int userId);

	public boolean checkStatus(int reportId, int userId);
	
}
