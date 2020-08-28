package com.tas.reportman.controller;

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
							    @ModelAttribute("report") Report theReport) {	
		if (theReport == null) {
			model.addAttribute("report", new Report());
		} else {
			model.addAttribute("report", theReport);
		}
		
		model.addAttribute("successMessage", theMessage);		
		return "report-create";
	}
	
	@PostMapping("/addNewReport")
	public String addNewReport(@Valid @ModelAttribute("report") Report theReport, 
							   BindingResult result, 
							   RedirectAttributes redirectAttrs,
							   HttpSession session) {
		
		if(result.hasErrors()) {
			return "report-create";
		}
		
		User user = (User)session.getAttribute("user");
		
		Boolean r = reportService.checkIfReportDateUnique(theReport, user.getId());
		 if (r == true) {
			// save report object to database
			reportService.saveOrUpdateReport(theReport, user.getId());	
			redirectAttrs.addFlashAttribute("message", "日報追加しました");
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
		List<Report> reports = reportService.getAllReports(id);	
		model.addAttribute("reports", reports);
		model.addAttribute("message", "日報が存在しません");
		return "report-list";
	}
	
	@GetMapping("/list/filter")
	public String showFilteredReports(ModelMap model, 
									  @RequestParam("year") String year,
									  @RequestParam("month") String month,
									  @RequestParam("id") int id) {
		List<Report> reports = reportService.getFilteredReports(year, month, id);	
		model.addAttribute("reports", reports);
		model.addAttribute("message", "フィルターの結果が見つかりません");
		return "report-list";
	}
	
	@GetMapping("/edit")
	public String showFilteredReports(ModelMap model, 
									  @RequestParam("reportId") int id) {
		Report report = reportService.getReport(id);	
		model.addAttribute("report", report);
		return "report-edit";
	}
	
	@PostMapping("/editReport")
	public String editReport(@Valid @ModelAttribute("report") Report theReport, 
							   BindingResult result, 
							   HttpSession session,
							   final RedirectAttributes redirectAttrs) {
		if(result.hasErrors()) {
			return "report-edit";
		}
		
		User user = (User)session.getAttribute("user");
		
		int userId = user.getId();
		
		// save report object to database
		reportService.saveOrUpdateReport(theReport, userId);	
		
		redirectAttrs.addFlashAttribute("message", "日報編集しました");
		// redirect to previous page
		return "redirect:/report/list/?id=" + userId;
	}   
	

}



