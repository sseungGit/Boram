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


public class ServiceOrderServiceImpl implements ServiceOrderService{
	
	@Autowired
	private ServiceOrderDao dao;


	@Override
	public void getData4(HttpServletRequest request) {
		
	}

	@Override
	public void insert2(ModelAndView mView, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		int inum=Integer.parseInt(request.getParameter("inum"));
		int num=Integer.parseInt(request.getParameter("num"));
		int price=Integer.parseInt(request.getParameter("price"));
		String addr=(String)request.getSession().getAttribute("addr");
		Order_ItemsDto dto1=new Order_ItemsDto();
		Service_OrderDto dto2=new Service_OrderDto();
		
	}
}
