package com.tas.reportman.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tas.reportman.entity.Report;
import com.tas.reportman.entity.User;
import com.tas.reportman.form.ReportMonthlyStatusForm;
import com.tas.reportman.service.ReportService;
import com.tas.reportman.service.UserService;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/create")
	public String showCreateNew(ModelMap model, 
							    @ModelAttribute("message") String theMessage,
							    @ModelAttribute("successMessage") String successMessage,
							    @ModelAttribute("report") Report theReport) {	
		
		if (theReport == null) {
			Report report = new Report();
			model.addAttribute("report", report);
		} else {
			model.addAttribute("report", theReport);
		}
		
		model.addAttribute("errorMessage", theMessage);		
		model.addAttribute("successMessage", successMessage);	
		return "report_create";
		
	}
	
	@PostMapping("/addNewReport")
	public String addNewReport(@Valid @ModelAttribute("report") Report theReport, 
							   BindingResult result, 
							   RedirectAttributes redirectAttrs,
							   HttpSession session) {
		
		if(result.hasErrors()) {
			return "report_create";
		}
		
		User user = (User)session.getAttribute("user");
		
		// Check if report date is unique
		Boolean r = reportService.checkIfReportDateUnique(theReport, user.getId());		
		if (r == true) {
			Report report = reportService.trimReport(theReport);			 
			// save report object to database
			reportService.saveOrUpdateReport(report, user.getId());	
			redirectAttrs.addFlashAttribute("successMessage", "日報追加しました");
			 } else {
			redirectAttrs.addFlashAttribute("report", theReport);
			redirectAttrs.addFlashAttribute("message", "ご指定の日付にすでに日報が存在します");
		}	
		
		// redirect to previous page
		return "redirect:/report/create";
	}    
	
	
	@GetMapping("/list")
	public String showAllReports(ModelMap model,
								@RequestParam("id") int id) {	
		// get list reports
		List<Report> reports = reportService.getAllReports(id);	
		
		// add model attributes
		model.addAttribute("reports", reports);
		model.addAttribute("message", "日報が存在しません");
		
		return "report_list";
		
	}
	
	@GetMapping("/list/filter")
	public String showFilteredReports(ModelMap model, 
									  @RequestParam("year") String year,
									  @RequestParam("month") String month,
									  @RequestParam("id") int id) {
		
		List<Report> reports = reportService.getFilteredReports(year, month, id);	
		
		model.addAttribute("reports", reports);
		model.addAttribute("message", "フィルターの結果が見つかりません");
		
		return "report_list";
		
	}
	
	@GetMapping("/edit")
	public String showFilteredReports(ModelMap model, 
									  @RequestParam("reportId") int id) {
		
		Report report = reportService.getReport(id);	
		
		model.addAttribute("report", report);
		
		return "report_edit";
	}
	
	@PostMapping("/editReport")
	public String editReport(@Valid @ModelAttribute("report") Report theReport, 
							   BindingResult result, 
							   HttpSession session,
							   final RedirectAttributes redirectAttrs) {
		
		if(result.hasErrors()) {
			return "report_edit";
		}
		
		User user = (User)session.getAttribute("user");
		
		int userId = user.getId();
		
		Report report = reportService.trimReport(theReport);
		
		// save report object to database
		reportService.saveOrUpdateReport(report, userId);	
		
		redirectAttrs.addFlashAttribute("message", "日報編集しました");
		
		// redirect to previous page
		return "redirect:/report/list/?id=" + userId;
	}  
	
	@GetMapping("/month/status")
	public String showMonthStatus(ModelMap model, 
								  HttpSession session,
								  @RequestParam("id") int id) {
		int year = java.time.LocalDate.now().getYear();
		int month = java.time.LocalDate.now().getMonthValue();
		
		String monthString = month < 10 ? "0" + Integer.toString(month) : Integer.toString(month);
		String yearString = Integer.toString(year);
	
		// get list report of the current month
		List<Report> reports = reportService.getFilteredReports(yearString, monthString, id);
		
		//get month days
		int monthDays = getMonthDays(month, year);
		
		User user = (User)session.getAttribute("user");
		
		model.addAttribute("reports", convertToReportMonthlyStatusForm(reports));
		model.addAttribute("month", month < 10 ? "0" + month : month);
		model.addAttribute("year", year);
		model.addAttribute("monthDays", monthDays);
		model.addAttribute("empName", user.getUserName());
		
		return "report_month_status";
	}
	
	@GetMapping("/month/status/filter")
	public String showMonthStatusWithFilter(ModelMap model, 
											@RequestParam("year") String year,
											@RequestParam("month") String month,
											@RequestParam("id") int id,
											@RequestParam("empName") String empName) {
			
		// get list report of the current month
		List<Report> reports = reportService.getFilteredReports(year, month, id);
				
		//get month days
		int monthDays = getMonthDays(Integer.parseInt(month), Integer.parseInt(year));
		
		model.addAttribute("reports", convertToReportMonthlyStatusForm(reports));
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("monthDays", monthDays);
		model.addAttribute("empName", empName);
		
		return "report_month_status";
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
	
	
	public List<ReportMonthlyStatusForm> convertToReportMonthlyStatusForm(List<Report> reports) {		
		List<ReportMonthlyStatusForm> reportMonthlyStatusForms = new ArrayList<ReportMonthlyStatusForm>();
		
		for (Report report:reports) {
			ReportMonthlyStatusForm temp = new ReportMonthlyStatusForm();
			temp.setId(report.getId());
			temp.setDate(report.getDate());
			reportMonthlyStatusForms.add(temp);			
		}		
		return reportMonthlyStatusForms;
	}
	

}



