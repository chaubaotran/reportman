package com.tas.reportman.service;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tas.reportman.dao.ReportDao;
import com.tas.reportman.entity.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;

	@Override
	@Transactional
	public List<Report> getAllReports(int id) {
		return reportDao.getAllReports(id);
	}

	@Override
	@Transactional
	public Report getReport(int id) {
		return reportDao.getReport(id);
	}

	@Override
	@Transactional
	public void saveOrUpdateReport(Report report, int userId) {
		reportDao.saveOrUpdateReport(report, userId);
	}

	@Override
	@Transactional
	public List<Report> getFilteredReports(String year, String month, int id) {
		return reportDao.getFilteredReports(year, month, id);
	}

	@Override
	public Boolean checkIfReportDateUnique(@Valid Report theReport, int id) {
		return reportDao.checkIfReportDateUnique(theReport, id);
	}

}
