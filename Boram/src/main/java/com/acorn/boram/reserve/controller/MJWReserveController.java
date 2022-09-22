package com.acorn.boram.reserve.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.reserve.service.ItemService;
import com.acorn.boram.reserve.service.ServiceOrderService;

@Controller
public class MJWReserveController {

   

   
   @RequestMapping("/reserve/reserve_select")
   public String reserve_select(HttpServletRequest request) {
      return "reserve/reserve_select";
   }
   
   @RequestMapping("/reserve/select")
   public ModelAndView reserve_select(HttpServletRequest request,String category) {
      
      //카테고리 값 확인
      System.out.println("category : "+category);
      
      ModelAndView mView=new ModelAndView();
      //category키 값으로 value에 category값 담기
      mView.addObject("category", category);
      if(category.equals("clothes")) {
         mView.setViewName("reserve/reserve_wash");
      }else if(category.equals("bedding")){
         mView.setViewName("reserve/reserve_bed");
      }else if(category.equals("shoes")){
         mView.setViewName("reserve/reserve_shoes");
      }else if(category.equals("living")){
         mView.setViewName("reserve/reserve_living");
      }
      return mView;
   }
   
   @RequestMapping("/reserve/reserve_wash")
   public String reserve_wash() {
      return "reserve/reserve_wash";
   }
   
   @RequestMapping("/reserve/reserve_credit")
   public String reserve_credit() {
      return "reserve/reserve_credit";
   }
   
   @RequestMapping("/reserve/reserve_bed")
   public String reserve_bed() {
      return "reserve/reserve_bed";
   }
   
   @RequestMapping("/reserve/reserve_shoes")
   public String reserve_shoes() {
      return "reserve/reserve_shoes";
   }
   @RequestMapping("/reserve/reserve_living")
   public String reserve_living() {
      return "reserve/reserve_living";
   }
}