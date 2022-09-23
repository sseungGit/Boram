package com.acorn.boram.orderlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.orderlist.dto.LsaOrderListDto;

@Repository
public class LsaOrderListDaoImpl implements LsaOrderListDao{
	@Autowired
	private SqlSession session;
	
	public List<LsaOrderListDto> getOrderList(String userId){
		return session.selectList("orders.getOrderList", userId);
	}

	@Override
	public List<LsaOrderListDto> getOrderDetailList(String code) {
		return session.selectList("orders.getOrderDetailList",  code);
	}
}
