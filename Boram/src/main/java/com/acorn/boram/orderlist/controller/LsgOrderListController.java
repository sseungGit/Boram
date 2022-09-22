package com.acorn.boram.orderlist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.service.LsgOrderListService;

@Controller
public class LsgOrderListController {
	
	@Autowired
	private LsgOrderListService service;
	
	@RequestMapping("/orderlist/list")
	public ModelAndView managementList(ModelAndView mView) {
		service.getOrderList(mView);
		mView.setViewName("mypage/orderList/order_management");
		return mView;
	}
}
