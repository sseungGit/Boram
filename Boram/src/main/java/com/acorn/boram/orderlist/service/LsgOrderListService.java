package com.acorn.boram.orderlist.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;

public interface LsgOrderListService {
	public void getOrderList(HttpServletRequest request,ModelAndView mView);
	public void getDataOrder(ModelAndView mView, LsgOrderListDto dto);
}
