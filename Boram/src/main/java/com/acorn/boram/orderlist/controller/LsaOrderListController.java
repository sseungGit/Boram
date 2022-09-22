package com.acorn.boram.orderlist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.boram.orderlist.service.LsaOrderListService;

@Controller
public class LsaOrderListController {
	
	@Autowired
	private LsaOrderListService ordersService;
	
	@RequestMapping("/mypage/orderList/customer")
	public String brandpage(Model model, HttpSession session) {
		/*
		 * String userId = (String) session.getAttribute("userId");
		 * char manager = (char) session.getAttribute("manager");
		 * if(manager=='N'){
		 * 	 manager의 값이 N일 경우 해당 페이지가 보이면 안되기 때문에
		 *   여기서 다른 페이지로 리다이렉션을 하던 오류를 떨궈주던 해야함 
		 * }
		 */
		model.addAttribute("orderList", ordersService.getOrderList("seung"));
		return "mypage/orderList/customer";
	}
	

	@RequestMapping("/mypage/orderList/customer2")
	public String brandpage(Model model, @RequestParam("code") String code) {
		model.addAttribute("orderDetailList", ordersService.getOrderDetailList(code));
		return "mypage/orderList/customer2";
	}
}