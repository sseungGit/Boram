package com.acorn.boram.orderlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.orderlist.dto.LsgOrderListDto;
import com.acorn.boram.orderlist.service.LsaOrderListService;
import com.acorn.boram.orderlist.service.LsgOrderListService;

@Controller
public class LsgOrderListController {
	
	@Autowired
	private LsaOrderListService ordersService;
	@Autowired
	private LsgOrderListService service;
	
	//매니저 여부에 따라 화면 이동
	@RequestMapping("/mypage/order")
	public ModelAndView authSelectPage(HttpServletRequest request,ModelAndView mView,HttpSession session) {
		String isManager=session.getAttribute("manager").toString();
		if(isManager.equals("N")) {
			//관리자가 아닌경우
			ordersService.getOrderListData(mView,session);
			mView.setViewName("mypage/orderList/customer3");
		}else {
			//관리자일 경우
			service.getOrderList(request,mView);
			mView.setViewName("mypage/admin/list");
		}
		return mView;
	}
	
	//(관리자)상세 페이지로 이동
	@RequestMapping("/mypage/admin_detail")
	public ModelAndView authAdminDetail(HttpServletRequest request
			, ModelAndView mView, LsgOrderListDto dto) {
		String isManager=request.getSession().getAttribute("manager").toString();
		if(isManager.equals("Y")) {
			service.getDataOrder(mView,dto);
			mView.setViewName("mypage/admin/detail");
		}else {
			mView.setViewName("redirect:/home.do");
		}
		return mView;
	}
	
	//(관리자)상태에따라 리스트 검색
	@RequestMapping("/mypage/select_state")
	public ModelAndView authAjaxGetList(HttpServletRequest request
			, ModelAndView mView, LsgOrderListDto dto){
		String isManager=request.getSession().getAttribute("manager").toString();
		System.out.println(request.getParameter("state"));
		if(isManager.equals("Y")) {
			service.getOrderList(request,mView);
			mView.setViewName("mypage/admin/test");
		}else {
			mView.setViewName("redirect:/home.do");
		}
		return mView;
	}
}
