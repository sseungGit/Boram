package com.acorn.boram.reserve.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.boram.reserve.dto.Order_ItemsDto;

public interface OrderItemService {
	public void getData2(HttpServletRequest request);
	public void insert1(Order_ItemsDto dto, HttpServletRequest request);
}
