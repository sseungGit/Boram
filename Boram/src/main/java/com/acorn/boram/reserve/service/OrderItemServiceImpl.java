package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.acorn.boram.reserve.dto.Order_ItemsDto;

@Service
public class OrderItemServiceImpl implements OrderItemService{

	@Override
	public void getData2(HttpServletRequest request) {
		
		
	}

	@Override
	public void productCountInsert(Order_ItemsDto dto, HttpSession session) {
		String code=(String)session.getAttribute("code");
		String inum=(String)session.getAttribute("inum");
		String count=(String)session.getAttribute("count");
	}

}
