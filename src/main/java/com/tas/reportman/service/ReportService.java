package com.tas.reportman.service;

import java.util.List;

import javax.validation.Valid;

import com.tas.reportman.entity.Report;

public interface ReportService {

	List<Report> getAllReports(int id);
	
	Report getReport(int id);
	
	public void saveOrUpdateReport(Report report, int userId);

	List<Report> getFilteredReports(String year, String month, int id);

	Boolean checkIfReportDateUnique(@Valid Report theReport, int id);
}
