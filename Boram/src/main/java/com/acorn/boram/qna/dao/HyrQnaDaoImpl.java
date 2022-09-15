package com.acorn.boram.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.boram.qna.dto.HyrQnaDto;

@Repository
public class HyrQnaDaoImpl implements HyrQnaDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<HyrQnaDto> getList(HyrQnaDto dto) {
		
		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount(HyrQnaDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(HyrQnaDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HyrQnaDto getData(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addViewCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(HyrQnaDto dto) {
		// TODO Auto-generated method stub
		
	}

}
