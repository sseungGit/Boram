package com.acorn.boram.lsg;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

	@RequestMapping("/users/login")
	public String loginPage() {
		return "users/login";
	}
}
