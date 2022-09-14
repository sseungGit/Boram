package com.acorn.boram.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class KjReviewController {

	@RequestMapping("/review/list")
	public String qnaPage() {
		return "review/list";
	}
}
