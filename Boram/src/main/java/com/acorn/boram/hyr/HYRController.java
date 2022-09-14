package com.acorn.boram.hyr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HYRController {
	@RequestMapping("/customer/qna")
	public String qnaPage() {
		return "customer/qna";
	}
	
}
