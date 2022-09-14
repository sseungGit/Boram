package com.acorn.boram.reserve.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MJWReserveController {

	@RequestMapping("/users/reserve")
	public String reservePage() {
		return "users/reserve";
	}
}
