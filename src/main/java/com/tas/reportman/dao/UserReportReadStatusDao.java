package com.tas.reportman.dao;

import java.util.List;

import com.tas.reportman.entity.Report;

public interface UserReportReadStatusDao {

	List<Report> getUnreadReports(int empId, int managerId);

	void confirmReadReport(int reportId, int userId);
}
