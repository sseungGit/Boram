package com.acorn.boram.orderlist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LsgOrderListController {
	
	@RequestMapping("/order/management")
	public String managementList() {
		return "mypage/order/order_management";
	}
}
