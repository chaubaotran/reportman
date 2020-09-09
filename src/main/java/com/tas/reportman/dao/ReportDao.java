package com.tas.reportman.dao;

import java.util.List;

import javax.validation.Valid;

import com.tas.reportman.entity.Report;

public interface ReportDao {

	public List<Report> getAllReports(int id);
	
	public Report getReport(int id);
	
	public void saveOrUpdateReport(Report report, int userId);

	public List<Report> getFilteredReports(String year, String month, int id);

	public Boolean checkIfReportDateUnique(@Valid Report theReport, int id);

	public List<Report> getAll();
}
