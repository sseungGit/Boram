package com.acorn.boram.reserve.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.acorn.boram.reserve.dao.ItemDao;
import com.acorn.boram.reserve.dto.ItemsDto;

public class ItemServiceImpl implements ItemService{

	@Autowired 
	private ItemDao ItemDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		ItemsDto dto= new ItemsDto();
		List<ItemsDto> list=ItemDao.getList(dto);
	}

	@Override
	public void getList2(HttpServletRequest request) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list2=ItemDao.getList(dto);
	}

	@Override
	public void getList3(HttpServletRequest request) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list3=ItemDao.getList(dto);
		
	}

	@Override
	public void getList4(HttpServletRequest request) {
		ItemsDto dto = new ItemsDto();
		List<ItemsDto> list4=ItemDao.getList(dto);
		
	}

}
