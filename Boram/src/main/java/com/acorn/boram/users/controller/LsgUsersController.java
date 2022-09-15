package com.acorn.boram.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LsgUsersController {

	@RequestMapping("/loginform")
	public String loginPage() {
		System.out.println("test");
		return "mypage/login/loginform";
	}
}
