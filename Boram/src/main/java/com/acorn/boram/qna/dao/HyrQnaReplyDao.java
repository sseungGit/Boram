package com.acorn.boram.qna.dao;

import java.util.List;

import com.acorn.boram.qna.dto.HyrQnaReplyDto;

public interface HyrQnaReplyDao {
	//댓글 목록 얻어오기 
	public List<HyrQnaReplyDto> getList(HyrQnaReplyDto dto);
	//댓글 삭제 
	public void delete(int num);
	//댓글 추가 
	public void insert(HyrQnaReplyDto dto);
	//추가할 댓글의 글번호를 리턴하는 메소드 
	public int getSequence();
	//댓글 수정
	public void update(HyrQnaReplyDto dto);
	//댓글 하나의 정보를 리턴하는 메소드
	public HyrQnaReplyDto getData(int num);

}
