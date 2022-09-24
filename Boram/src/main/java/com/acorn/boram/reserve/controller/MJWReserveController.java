package com.acorn.boram.reserve.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.service.ItemService;
import com.acorn.boram.reserve.service.ServiceOrderService;

@Controller
public class MJWReserveController {

	@Autowired
	private ItemService service;

   @RequestMapping("/reserve/reserve_select")
   public String reserve_select(HttpServletRequest request) {
      return "reserve/reserve_select";
   }
   
   @RequestMapping("/reserve/select")
   public ModelAndView reserve_select(ModelAndView mView,String category) {
      
      //카테고리 값 확인
      System.out.println("category : "+category);
      //category키 값으로 value에 category값 담기
      mView.addObject("category", category);
      if(category.equals("clothes")) {
    	  service.getList(mView);
    	  mView.setViewName("reserve/reserve_wash");
      }else if(category.equals("bedding")){
    	  service.getList2(mView);
    	  mView.setViewName("reserve/reserve_bed");
      }else if(category.equals("shoes")){
    	  service.getList3(mView);
    	  mView.setViewName("reserve/reserve_shoes");
      }else if(category.equals("living")){
    	  service.getList4(mView);
    	  mView.setViewName("reserve/reserve_living");
      }
      	return mView;
   }

   
   @RequestMapping("/reserve/reserve_credit")
   public ModelAndView reserve_credit(HttpServletRequest request, ModelAndView mView, String name, String price, String count, String date) {
	   mView.addObject("name", name);
	   mView.addObject("price", price);
	   mView.addObject("count", count);
	   mView.addObject("date", date);
	   mView.setViewName("reserve/reserve_credit");
      return mView;
   }
   
   @RequestMapping("/reserve/insert")
   public ModelAndView reserve_insert(HttpServletRequest request, ModelAndView mView, String name, String price, String count, String date) {
	   request.getSession().getAttribute("id");
	   request.getSession().getAttribute("addr");
	   
	   
	   
	   mView.setViewName("/reserve/insert");
	   return mView;
   }

}