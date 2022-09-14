package com.acorn.boram.mjw;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {

	@RequestMapping("/users/reserve")
	public String reservePage() {
		return "users/reserve";
	}
}
