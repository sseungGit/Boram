package com.acorn.boram.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HyrQnaController {
	@RequestMapping("/qna/list")
	public String qnaPage() {
		return "qna/list";
	}
	
}
