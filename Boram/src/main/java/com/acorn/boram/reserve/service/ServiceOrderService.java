package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

public interface ServiceOrderService {
	public void getData4(HttpServletRequest request);
	public void productAddr(String id, ModelAndView mView);
	public void productInsert(Service_OrderDto dto);
}
