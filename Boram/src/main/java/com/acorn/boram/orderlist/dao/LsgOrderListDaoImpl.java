package com.acorn.boram.orderlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Repository
public class LsgOrderListDaoImpl implements LsgOrderListDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<LsgOrderListDto> getList(LsgOrderListDto dto) {
		System.out.println("dao code: "+dto.getCode());
		System.out.println("dao orderer: "+dto.getOrderer());
		System.out.println("dao name: "+dto.getName());
		System.out.println("dao state: "+dto.getState());
		return session.selectList("orderList.getList",dto);
	}

	@Override
	public int getCount(LsgOrderListDto dto) {
		return session.selectOne("orderList.getCount",dto);
	}

	@Override
	public LsgOrderListDto getData(LsgOrderListDto dto) {
		return session.selectOne("orderList.getData",dto);
	}

}
