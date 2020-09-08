package com.tas.reportman.controller;

import java.util.ArrayList;
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
import com.tas.reportman.form.EmpListForm;
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
	public String showListEmployee(ModelMap model,
								   HttpSession session) {
		
		// get employee list
		List<User> employees = userService.getAllEmps();
		
		// get current logged in user
		User user = (User)session.getAttribute("user");
		
		List<EmpListForm> empList = new ArrayList<EmpListForm>();
		
		for (User emp:employees) {
			
			// get unread report number
			int tempUnread = userReportReadService.getUnreadReports(emp.getId(), user.getId()).size();
			// get all report number
			int tempAll = reportService.getAllReports(emp.getId()).size();
			
			EmpListForm tempEmp = new EmpListForm();
			
			// populate the tempEmp
			tempEmp.setId(emp.getId());
			tempEmp.setUserName(emp.getUserName());
			tempEmp.setUnreadNumber(tempUnread);
			tempEmp.setReportNumber(tempAll);
			
			empList.add(tempEmp);
		}
		
		// add to model
		model.addAttribute("employees", empList);		
			
		return "emp_list";
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
		model.addAttribute("allNumber", reports.size());
		model.addAttribute("unReadNumber", unReadReports.size());
		model.addAttribute("empId", id);
		model.addAttribute("empName", empName);
		
		return "emp_report_list";
	}
	
	@GetMapping("report/list/unread")
	public String showUnreadEmpReports(ModelMap model,
										@RequestParam("id") int id,
										@RequestParam("empName") String empName,
										@RequestParam("allNumber") String allNumber,
										@RequestParam("unReadNumber") String unReadNumber,
										HttpSession session) {
		
		// get all unread reports
		User user = (User)session.getAttribute("user");
		List<Report> unReadReports = userReportReadService.getUnreadReports(id, user.getId());
		
		// add model attributes
		model.addAttribute("reports", unReadReports);
		model.addAttribute("unReadReports", unReadReports);
		model.addAttribute("allNumber", allNumber);
		model.addAttribute("unReadNumber", unReadNumber);
		model.addAttribute("empId", id);
		model.addAttribute("empName", empName);
		
		return "emp_report_list";
	}
	
	@GetMapping("report/list/filter")
	public String showEmpFilteredReports(ModelMap model, 
							  @RequestParam("year") String year,
							  @RequestParam("month") String month,
							  @RequestParam("id") int id,
							  @RequestParam("empName") String empName,
							  @RequestParam("allNumber") String allNumber,
							  @RequestParam("unReadNumber") String unReadNumber,
							  HttpSession session) {
		
		List<Report> reports = reportService.getFilteredReports(year, month, id);	


		// get all unread reports
		User user = (User)session.getAttribute("user");
		List<Report> unReadReports = userReportReadService.getUnreadReports(id, user.getId());
		
		// add model attributes
		model.addAttribute("reports", reports);
		model.addAttribute("unReadReports", unReadReports);
		model.addAttribute("empId", id);
		model.addAttribute("empName", empName);
		model.addAttribute("allNumber", allNumber);
		model.addAttribute("unReadNumber", unReadNumber);
		return "emp_report_list";
	}
	
	@GetMapping("/report")
	public String showEmpReport(ModelMap model,
								@RequestParam("id") int id,
								@RequestParam("unread") boolean unread) {
		
		Report report = reportService.getReport(id);	
		model.addAttribute("report", report);
		model.addAttribute("emp", report.getUser());
		model.addAttribute("unread", unread);
			
		return "emp_report_read";
	}
	
	@PostMapping("/report/confirm")
	public String confirmReport(ModelMap model,
								@ModelAttribute("report") Report report,
								HttpSession session) {
		User user = (User)session.getAttribute("user");
		userReportReadService.confirmReadReport(report.getId(), user.getId());

		Report theReport = reportService.getReport(report.getId());	
		
		model.addAttribute("report", report);
		model.addAttribute("emp", theReport.getUser());
		model.addAttribute("unread", false);
		model.addAttribute("message", "確認終了しました");
			
		return "emp_report_read";
	}
}
	
