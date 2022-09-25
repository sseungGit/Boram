package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dao.ServiceOrderDao;
import com.acorn.boram.reserve.dto.Order_ItemsDto;
import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

@Service
public class ServiceOrderServiceImpl implements ServiceOrderService{
	
	@Autowired
	private ServiceOrderDao dao;


	@Override
	public void getData4(HttpServletRequest request) {
		
	}

	@Override
	public void productInsert(HttpSession session, Service_OrderDto dto) {
		String orderer=(String)session.getAttribute("orderer");
		String category=(String)session.getAttribute("category");
		String order_price=(String)session.getAttribute("order_price");
		String order_addr=(String)session.getAttribute("order_addr");
		String regdate=(String)session.getAttribute("regdate");
		String reservation_date=(String)session.getAttribute("reservation_date");
		String request=(String)session.getAttribute("request");
		String state=(String)session.getAttribute("state");
		String get_invoice_num=(String)session.getAttribute("get_invoice_num");
		String send_invoice_num=(String)session.getAttribute("send_invoice_num");

		dto.setOrderer(orderer);
		
	}

	@Override
	public void productAddr(String id, ModelAndView mView) {
		System.out.println(id);
		LsgUsersDto dto=dao.productAddr(id);
		mView.addObject("dto",dto);
	}
}