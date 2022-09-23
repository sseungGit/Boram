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
	public List<LsgOrderListDto> getList() {
		return session.selectList("orderList.getList");
	}

}
