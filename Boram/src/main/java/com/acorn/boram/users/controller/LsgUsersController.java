package com.acorn.boram.users.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dto.LsgUsersDto;
import com.acorn.boram.users.service.LsgUsersService;

@Controller
public class LsgUsersController {
	
	@Autowired
	private LsgUsersService service; 
	
	//로그인 화면으로 이동
	@RequestMapping("/users/login_form")
	public String loginForm() {
		return "mypage/login/login_form";
	}
	
	//로그인하기
	@RequestMapping("/users/login")
	public ModelAndView login(HttpSession session, LsgUsersDto dto,
			ModelAndView mView) {
		service.isExistUser(session,dto,mView);
		mView.setViewName("mypage/login/login");
		return mView;
	}
	
	//로그아웃
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:/home.do";
	}
	
	//회원가입 화면으로 이동
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "mypage/login/signup_form";
	}
	
	//비밀번호 찾기 화면으로 이동
	@RequestMapping("/users/find_pwd_form")
	public String findPwdForm() {
		return "mypage/login/find_pwd_form";
	}
	
	//비밀번호 찾기
	@RequestMapping("/users/find_pwd")
	public String findPwd(LsgUsersDto dto) {
		return "mypage/login/find_pwd_form";
	}
	
	//회원가입
	@RequestMapping("/users/signup")
	public String signUp(LsgUsersDto dto) {
		service.addUser(dto);
		return "mypage/login/signup";
	}
}
