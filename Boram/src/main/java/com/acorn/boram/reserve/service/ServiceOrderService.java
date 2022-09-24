package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.dto.Service_OrderDto;

public interface ServiceOrderService {
	public void getData4(HttpServletRequest request);
	public void insert2(ModelAndView mView, HttpServletRequest request);
}
