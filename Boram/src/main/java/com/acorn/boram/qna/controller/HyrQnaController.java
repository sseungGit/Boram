package com.acorn.boram.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.service.HyrQnaService;

@Controller
public class HyrQnaController {
	
	@Autowired
	private HyrQnaService service;
	
	@RequestMapping("/qna/list")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		
		return "qna/list";
	}
	
	//1대1문의하러 가기
	@RequestMapping("/qna/question")
	public String questionPage() {
		return "qna/question";
	}
}
