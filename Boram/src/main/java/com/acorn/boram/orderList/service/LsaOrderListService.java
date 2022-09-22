package com.acorn.boram.orderList.service;

import java.util.List;

import com.acorn.boram.orderList.dto.LsaOrderListDto;

public interface LsaOrderListService {
	public List<LsaOrderListDto> getOrderList(String userId);
	public List<LsaOrderListDto> getOrderDetailList(String code);
}