package com.acorn.boram.orderlist.dao;

import java.util.List;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;

public interface LsgOrderListDao {
	public List<LsgOrderListDto> getList(LsgOrderListDto dto);
	public int getCount(LsgOrderListDto dto);
	public LsgOrderListDto getData(LsgOrderListDto dto);
}
