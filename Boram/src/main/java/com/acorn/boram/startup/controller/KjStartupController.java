package com.acorn.boram.startup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KjStartupController {
	
	@RequestMapping("/corporation/startup")
	public String startuppage() {
		return "corporation/startup";
	}
}
