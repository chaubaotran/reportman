package com.tas.reportman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestJspController {

	@GetMapping("/")
	public String showTestPage() {
		return "test";
	}
}
