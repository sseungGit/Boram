package com.acorn.boram.qna.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.dto.HyrQnaDto;
import com.acorn.boram.qna.dto.HyrQnaReplyDto;

public interface HyrQnaService {
	public void getList(HttpServletRequest request);
	//업로드된 파일 저장하기 
	public void saveFile(HyrQnaDto dto, ModelAndView mView,
			HttpServletRequest request);
	//파일하나의 정보 얻어오기 
	public void getFileData(int num, ModelAndView mView);
	//파일 삭제하기
	public void deleteFile(int num, HttpServletRequest request);	
	public void getDetail(HttpServletRequest request);
	public void updateContent(HyrQnaDto dto);
	public void getData(HttpServletRequest request);
	public void saveReply(HttpServletRequest request);//답변 저장 
	public void deleteReply(HttpServletRequest request);//답변 삭제
	public void updateReply(HyrQnaReplyDto dto);//답변 수정
}
