package com.acorn.boram.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.reserve.dto.ItemsDto;

@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ItemsDto> getList(ItemsDto dto) {
		
		return session.selectOne("Reserve.getList", dto);
	}
}
