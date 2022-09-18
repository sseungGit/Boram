package com.acorn.boram.users.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.users.dto.LsgUsersDto;

@Repository
public class LsgUsersDaoImpl implements LsgUsersDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public boolean checkId(String inputId) {
		String id=session.selectOne("users.isExist",inputId);
		if(id!=null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void insertUser(LsgUsersDto dto) {
		session.insert("users.insert",dto);
	}

	@Override
	public LsgUsersDto getData(String id) {
		LsgUsersDto dto=session.selectOne("users.getData",id);
		return dto;
	}
}
