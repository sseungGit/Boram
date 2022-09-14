package com.acorn.boram.lsa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BrandController {
	
	@RequestMapping("/corporation/brand")
	public String brandpage() {
		return "corporation/brand";
	}
}
