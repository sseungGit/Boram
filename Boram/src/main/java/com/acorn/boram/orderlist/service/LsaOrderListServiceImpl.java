package com.acorn.boram.orderlist.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.boram.orderlist.dao.LsaOrderListDao;
import com.acorn.boram.orderlist.dto.LsaOrderListDto;

@Service
public class LsaOrderListServiceImpl implements LsaOrderListService{
	@Autowired
	private LsaOrderListDao ordersDAO;

	@Override
	public List<LsaOrderListDto> getOrderList(String userId) {
		return ordersDAO.getOrderList(userId);
	}

	@Override
	public List<LsaOrderListDto> getOrderDetailList(String code) {
		return ordersDAO.getOrderDetailList(code);
	}
}