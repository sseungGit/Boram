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
	public void productInsert(Service_OrderDto dto) {
		dao.productInsert(dto);
	}

	@Override
	public void productAddr(String id, ModelAndView mView) {
		System.out.println(id);
		LsgUsersDto dto=dao.productAddr(id);
		mView.addObject("dto",dto);
	}
}