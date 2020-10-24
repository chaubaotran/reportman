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
import com.tas.reportman.form.ReportMonthlyStatusForm;
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
		
		if (employees != null && employees.size() !=0) {
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
		} else {
			model.addAttribute("message", "No employees found (研修生がいません)");		
		}
	
		// add to model
		model.addAttribute("employees", empList);		
			
		return "emp_list";
	}
	
	@GetMapping("/find")
	public String showEmployee(ModelMap model,
							   @RequestParam("userName") String userName,
							   HttpSession session) {
		
		// get employee
		User emp = userService.findByUserName(userName);
		
		// get current logged in user
		User user = (User)session.getAttribute("user");
		
		List<EmpListForm> empList = new ArrayList<EmpListForm>();
		
		if (emp != null) {
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
		} else {
			model.addAttribute("message", "No employees found (お探しの研修生が見つかりません)");		
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
		model.addAttribute("message", "Read (確認終了しました)");
			
		return "emp_report_read";
	}
	
	@GetMapping("report/month/status")
	public String showMonthStatus(ModelMap model, 
								  @RequestParam("id") int id,
								  @RequestParam("empName") String empName,
								  HttpSession session) {
		int year = java.time.LocalDate.now().getYear();
		int month = java.time.LocalDate.now().getMonthValue();
		
		String monthString = month < 10 ? "0" + Integer.toString(month) : Integer.toString(month);
		String yearString = Integer.toString(year);
	
		// get list report of the current month
		List<Report> reports = reportService.getFilteredReports(yearString, monthString, id);
		
		//get month days
		int monthDays = getMonthDays(month, year);
		
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("reports", convertToReportMonthlyStatusForm(reports, user.getId()));
		model.addAttribute("month", monthString);
		model.addAttribute("year", year);
		model.addAttribute("monthDays", monthDays);
		model.addAttribute("empName", empName);
		model.addAttribute("empId", id);
		
		return "emp_report_month_status";
	}
	
	@GetMapping("report/month/status/filter")
	public String showMonthStatusWithFilter(ModelMap model, 
											@RequestParam("year") String year,
											@RequestParam("month") String month,
											@RequestParam("empId") int id,
											@RequestParam("empName") String empName, 
											HttpSession session) {
			
		// get list report of the current month
		List<Report> reports = reportService.getFilteredReports(year, month, id);
				
		//get month days
		int monthDays = getMonthDays(Integer.parseInt(month), Integer.parseInt(year));
		
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("reports", convertToReportMonthlyStatusForm(reports, user.getId()));
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("monthDays", monthDays);
		model.addAttribute("empName", empName);
		model.addAttribute("empId", id);
		
		return "emp_report_month_status";
	}
	
	public static int getMonthDays(int month, int year) {
	    int daysInMonth ;
	    if (month == 4 || month == 6 || month == 9 || month == 11) {
	        daysInMonth = 30;
	    }
	    else {
	        if (month == 2) {
	            daysInMonth = (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) ? 29 : 28;
	        } else {
	            daysInMonth = 31;
	        }
	    }
	    return daysInMonth;
	}
	
	
	public List<ReportMonthlyStatusForm> convertToReportMonthlyStatusForm(List<Report> reports, int id) {		
		List<ReportMonthlyStatusForm> reportMonthlyStatusForms = new ArrayList<ReportMonthlyStatusForm>();
		
		for (Report report:reports) {
			ReportMonthlyStatusForm temp = new ReportMonthlyStatusForm();
			temp.setId(report.getId());
			temp.setDate(report.getDate());
			temp.setRead(userReportReadService.checkStatus(report.getId(), id));
			
			reportMonthlyStatusForms.add(temp);			
		}		
		return reportMonthlyStatusForms;
	}
	
}
	
