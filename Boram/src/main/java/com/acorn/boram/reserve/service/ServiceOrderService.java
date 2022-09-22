package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.boram.reserve.dto.Service_OrderDto;

public interface ServiceOrderService {
	public void insert2(Service_OrderDto dto,HttpServletRequest request);
	public void getData4(HttpServletRequest request);
}
