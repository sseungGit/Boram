package com.acorn.boram.users.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.boram.users.service.LsgUsersService;


@Controller
public class LsgJsonUsersController {

	@Autowired
	private LsgUsersService service;
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String,Boolean> jsonCheckid(String inputId){
		Map<String,Boolean> map=new HashMap<>();
		map=service.checkId(inputId);
		return map;
	}
}
