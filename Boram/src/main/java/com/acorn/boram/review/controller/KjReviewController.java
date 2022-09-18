package com.acorn.boram.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class KjReviewController {

	@RequestMapping("/review/list")
	public String reviewPage() {
		return "review/list";
	}
	
	//리뷰 리스트 불러오기
	@RequestMapping("/review/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("review/insertform");
	}
}
