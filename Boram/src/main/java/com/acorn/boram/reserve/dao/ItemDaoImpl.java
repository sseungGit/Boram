package com.acorn.boram.reserve.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.ItemsDto;

@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public ItemsDto getData(int num) {
		
		return session.selectOne("Reserve.getData1", num);
	}

}
