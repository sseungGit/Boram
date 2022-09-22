package com.acorn.boram.users.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.users.dao.LsgUsersDao;
import com.acorn.boram.users.dto.LsgUsersDto;

@Service
public class LsgUsersServiceImpl implements LsgUsersService {
	
	@Autowired
	private LsgUsersDao dao;
	
	@Override
	public Map<String,Boolean> checkId(String inputId) {
		Map<String,Boolean> map=new HashMap<>();
		map.put("isExist", dao.checkId(inputId));
		return map;
	}

	@Override
	public void addUser(LsgUsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//관리자라도 함부러 셀렉트해서 볼 수 없게 암호화하는 것
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		dao.insertUser(dto);
	}
	
	@Override
	public boolean updatePwd(LsgUsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//관리자라도 함부러 셀렉트해서 볼 수 없게 암호화하는 것
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		boolean isSuccess=dao.UpdateUser(dto);
		return isSuccess;
	}

	@Override
	public void isExistUser(HttpSession session, LsgUsersDto dto,
			ModelAndView mView, HttpServletResponse response,
			HttpServletRequest request) {
		//입력한 정보가 맞는여부
		boolean isValid=false;		
		
		//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 해 본다. 
		LsgUsersDto result=dao.getData(dto.getId());
		if(result != null) {//만일 존재하는 아이디 라면
			//비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getPwd(); //DB 에 저장된 암호화된 비밀번호 
			String inputPwd=dto.getPwd(); //로그인폼에 입력한 비밀번호
			//Bcrypt 클래스의 static 메소드를 이용해서 일치 여부를 얻어낸다.
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		} 
		
		if(isValid) {//만일 유효한 정보이면 
			//쿠키 가져와서 cookies에 담기
			Cookie[] cookies=request.getCookies();
			Map<String,String> cName=new HashMap<>();
			for(Cookie c : cookies){
				cName.put(c.getName(),c.getValue());
			} 
			
			//만약 아이디 저장여부가 true면
			if(dto.isSaveId()) {
				Cookie cookie=null;
				if(!cName.containsKey("saveId")){
					//쿠키에 저장
				    cookie = new Cookie("saveId", dto.getId()); // 쿠키 이름 지정하여 생성( key, value 개념)
				    cookie.setMaxAge(365*24*60*60); //쿠키 유효 기간: 1년으로 설정
				    cookie.setPath("users/login_form.do"); //접근경로
				    response.addCookie(cookie); //response에 Cookie 추가
				}else {
					if(!cName.get("saveId").equals(dto.getId())) {
						cookie = new Cookie("saveId", dto.getId());
					    cookie.setMaxAge(365*24*60*60); //쿠키 유효 기간: 1년으로 설정
					    cookie.setPath("users/login_form.do"); //접근경로
					    response.addCookie(cookie); //response에 Cookie 추가
					}
				}	
			}else {
				if(cName.containsKey("saveId")){
					//쿠키 삭제
				    Cookie cookie = new Cookie("saveId", null); // 삭제할 쿠키에 대한 값을 null로 지정
				    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
				    response.addCookie(cookie); // 응답에 추가해서 없어지도록 함
				}	
			}
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getId());
			//매니저 여부 담기
			session.setAttribute("manager", result.getManager());
		}
	}

	@Override
	public LsgUsersDto checkUser(LsgUsersDto dto) {
		LsgUsersDto user=dao.isExistUser(dto);
		return user;
	}
}
