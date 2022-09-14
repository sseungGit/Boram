package com.acorn.boram.lsj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/notice/list")
	public String getList() {
		return "notice/list";
	}
}
