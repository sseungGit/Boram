package com.acorn.boram.users.service;

import java.util.HashMap;
import java.util.Map;

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
	public void isExistUser(HttpSession session, LsgUsersDto dto,
			ModelAndView mView) {
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
			//로그인 처리를 한다.
			session.setAttribute("id", dto.getId());
			//매니저/고객 여부 담기
			session.setAttribute("manager", result.getManager());
			isValid=true;
			mView.addObject("isValid",isValid);
		}
	}
}
