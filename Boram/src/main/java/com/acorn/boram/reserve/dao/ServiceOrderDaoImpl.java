package com.acorn.boram.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.Service_OrderDto;
import com.acorn.boram.users.dto.LsgUsersDto;

@Repository
public class ServiceOrderDaoImpl implements ServiceOrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public Service_OrderDto getData(int num) {
		
		return session.selectOne("Reserve.getData4", num);
	}

	@Override
	public void productInsert(Service_OrderDto dto) {
		session.insert("Reserve.insert2", dto);
	}

	@Override
	public LsgUsersDto productAddr(String id) {
		System.out.println(id);
		LsgUsersDto dto=session.selectOne("users.productAddr", id);
		return dto;
	}

}
