package com.tas.reportman.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.User;
import com.tas.reportman.service.ReportService;
import com.tas.reportman.service.UserService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReportService reportService;
	
	@GetMapping("/list")
	public String showListEmployee(ModelMap model) {
		
		// get employee list
		List<User> employees = userService.getAllEmps();
		
		// add to model
		model.addAttribute("employees", employees);		
			
		return "emp-list";
	}
	
	@GetMapping("report/list")
	public String showEmpReports(ModelMap model,
								@RequestParam("id") int id) {
		
		List<Report> reports = reportService.getAllReports(id);	
		model.addAttribute("reports", reports);
		model.addAttribute("id", id);
		return "emp-report-list";
	}
	
	@GetMapping("report/list/filter")
	public String showEmpFilteredReports(ModelMap model, 
							  @RequestParam("year") String year,
							  @RequestParam("month") String month,
							  @RequestParam("id") int id) {
		
		List<Report> reports = reportService.getFilteredReports(year, month, id);	
		model.addAttribute("reports", reports);
		model.addAttribute("id", id);
		return "emp-report-list";
	}
	
	@GetMapping("/report")
	public String showEmpReport(ModelMap model,
								@RequestParam("id") int id) {
		
		Report report = reportService.getReport(id);	
		model.addAttribute("report", report);
		model.addAttribute("emp", report.getUser());
			
		return "emp-report-read";
	}
}
	
