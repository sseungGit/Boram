package com.acorn.boram.members.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KjMembersController {

	@RequestMapping("/corporation/members")
	public String memberspage() {
		return "corporation/members";
	}
	
	
	
	
}
