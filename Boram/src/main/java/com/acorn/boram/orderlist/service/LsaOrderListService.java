package com.acorn.boram.orderlist.service;

import java.util.List;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;

public interface LsaOrderListService {
	public List<LsaOrderListDto> getOrderList(String userId);
	public List<LsaOrderListDto> getOrderDetailList(String code);
}