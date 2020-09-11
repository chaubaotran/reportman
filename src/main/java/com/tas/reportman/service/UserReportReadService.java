package com.tas.reportman.service;

import java.util.List;

import com.tas.reportman.entity.Report;

public interface UserReportReadService {
	
	public List<Report> getUnreadReports(int empId, int managerId);

	public void confirmReadReport(int reportId, int userId);
	
	public boolean checkStatus(int reportId, int userId);
	
}
