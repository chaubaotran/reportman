package com.tas.reportman.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyErrorController implements ErrorController {
	
	@RequestMapping("/error")
    public String handleError(HttpServletRequest request, ModelMap model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		model.addAttribute("error", status);
	    return "error";
    }

	@Override
	public String getErrorPath() {
		return "/error";
	}

}
