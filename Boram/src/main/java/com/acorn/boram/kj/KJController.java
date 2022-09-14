package com.acorn.boram.kj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KJController {

	@RequestMapping("/customer/review")
	public String reviewpage() {
	
		return "customer/review";
	}
}
