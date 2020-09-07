package com.tas.reportman.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.User;
import com.tas.reportman.service.ReportService;
import com.tas.reportman.service.UserReportReadService;
import com.tas.reportman.service.UserService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	UserReportReadService userReportReadService;
	
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
								@RequestParam("id") int id,
								@RequestParam("empName") String empName,
								HttpSession session) {
		
		// get all reports of the user
		List<Report> reports = reportService.getAllReports(id);	
		
		// get all unread reports
		User user = (User)session.getAttribute("user");
		List<Report> unReadReports = userReportReadService.getUnreadReports(id, user.getId());
		
		// add model attributes
		model.addAttribute("reports", reports);
		model.addAttribute("unReadReports", unReadReports);
		model.addAttribute("id", id);
		model.addAttribute("empName", empName);
		
		return "emp-report-list";
	}
	
	@GetMapping("report/list/filter")
	public String showEmpFilteredReports(ModelMap model, 
							  @RequestParam("year") String year,
							  @RequestParam("month") String month,
							  @RequestParam("id") int id,
							  HttpSession session) {
		
		List<Report> reports = reportService.getFilteredReports(year, month, id);	


		// get all unread reports
		User user = (User)session.getAttribute("user");
		List<Report> unReadReports = userReportReadService.getUnreadReports(id, user.getId());
		
		// add model attributes
		model.addAttribute("reports", reports);
		model.addAttribute("unReadReports", unReadReports);
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
	
	@PostMapping("/report/confirm")
	public String confirmReport(ModelMap model,
								@ModelAttribute("report") Report report,
								@RequestParam("unread") boolean unread,
								HttpSession session) {
		User user = (User)session.getAttribute("user");
		userReportReadService.confirmReadReport(report.getId(), user.getId());

		model.addAttribute("report", report);
		model.addAttribute("unread", unread);
		model.addAttribute("emp", report.getUser());
			
		return "emp-report-read";
	}
}
	
