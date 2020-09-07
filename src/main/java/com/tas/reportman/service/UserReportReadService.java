package com.tas.reportman.service;

import java.util.List;

import com.tas.reportman.entity.Report;

public interface UserReportReadService {
	
	List<Report> getUnreadReports(int empId, int managerId);

	void confirmReadReport(int reportId, int userId);
	
}
