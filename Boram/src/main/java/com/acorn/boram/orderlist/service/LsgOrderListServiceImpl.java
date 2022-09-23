package com.acorn.boram.orderlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dao.LsgOrderListDao;
import com.acorn.boram.orderlist.dto.LsgOrderListDto;

@Service
public class LsgOrderListServiceImpl implements LsgOrderListService {

	@Autowired
	private LsgOrderListDao dao;
		
	@Override
	public void getOrderList(ModelAndView mView) {
		List<LsgOrderListDto> list=dao.getList();
		mView.addObject("list", list);
	}

}
