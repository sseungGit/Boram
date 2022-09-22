package com.acorn.boram.orderList.dao;

import java.util.List;

import com.acorn.boram.orderList.dto.LsaOrderListDto;

public interface LsaOrderListDao {
	public List<LsaOrderListDto> getOrderList(String userId);
	public List<LsaOrderListDto> getOrderDetailList(String code);
	
}
