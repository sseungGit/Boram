package com.acorn.boram.reserve.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MJWReserveController {

	@RequestMapping("/reserve/reserve_select")
	public String reservePage() {
		return "reserve/reserve_select";
	}
	
	@RequestMapping("/reserve/reserve_wash")
	public String reserve_wash() {
		return "reserve/reserve_wash";
	}
	
	@RequestMapping("/reserve/reserve_credit")
	public String reserve_credit() {
		return "reserve/reserve_credit";
	}
	
	@RequestMapping("/reserve/reserve_bed")
	public String reserve_bed() {
		return "reserve/reserve_bed";
	}
	
	@RequestMapping("/reserve/reserve_shoes")
	public String reserve_shoes() {
		return "reserve/reserve_shoes";
	}
	@RequestMapping("/reserve/reserve_living")
	public String reserve_living() {
		return "reserve/reserve_living";
	}
}
