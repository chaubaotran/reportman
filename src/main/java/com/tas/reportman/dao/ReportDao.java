package com.tas.reportman.dao;

import java.util.List;

import javax.validation.Valid;

import com.tas.reportman.entity.Report;

public interface ReportDao {

	List<Report> getAllReports(int id);
	
	Report getReport(int id);
	
	public void saveOrUpdateReport(Report report, int userId);

	List<Report> getFilteredReports(String year, String month, int id);

	Boolean checkIfReportDateUnique(@Valid Report theReport, int id);

	List<Report> getAll();
}
