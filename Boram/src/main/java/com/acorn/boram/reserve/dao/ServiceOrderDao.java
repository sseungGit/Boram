package com.acorn.boram.reserve.dao;

import com.acorn.boram.reserve.dto.Service_OrderDto;

public interface ServiceOrderDao {
	public Service_OrderDto getData(int num);
	public void insert(Service_OrderDto dto);
}
