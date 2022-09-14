package com.acorn.boram.kjy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KJYController {

	@RequestMapping("/users/logout")
	public String logoutPage() {
		return "users/logout";
	}
}
