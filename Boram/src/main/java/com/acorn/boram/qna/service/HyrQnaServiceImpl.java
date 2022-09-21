package com.acorn.boram.qna.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.boram.qna.dao.HyrQnaDao;
import com.acorn.boram.qna.dao.HyrQnaReplyDao;
import com.acorn.boram.qna.dto.HyrQnaDto;
import com.acorn.boram.qna.dto.HyrQnaReplyDto;

@Service
public class HyrQnaServiceImpl implements HyrQnaService{
	
	@Autowired
	private HyrQnaDao qnaDao;
	@Autowired
	private HyrQnaReplyDao qnaReplyDao;
	
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=5;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum=request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		HyrQnaDto dto=new HyrQnaDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		//글 목록 얻어오기
		List<HyrQnaDto> list=qnaDao.getList(dto);
		//전체글 갯수
		int totalRow=qnaDao.getCount(dto);
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		//전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; //보정해 준다.
		}
		//view page 에서 필요한 값을 request 에 담아준다.
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void saveFile(HyrQnaDto dto, ModelAndView mView, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값 얻어오기 
		MultipartFile myFile=dto.getMyFile();
		//원본 파일명
		String orgFileName=myFile.getOriginalFilename();
		//파일의 크기
		long fileSize=myFile.getSize();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload=new File(filePath);
		if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
			upload.mkdir(); //만들어 준다.
		}
		//저장할 파일 명을 구성한다.
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			myFile.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		//dto 에 업로드된 파일의 정보를 담는다.
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id); //세션에서 읽어낸 파일 업로더의 아이디 
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		//fileDao 를 이용해서 DB 에 저장하기
		qnaDao.insert(dto);
		//view 페이지에서 사용할 모델 담기 
		mView.addObject("dto", dto);
		
	}

	@Override
	public void getFileData(int num, ModelAndView mView) {
		HyrQnaDto dto=qnaDao.getData(num);
		mView.addObject("dto", dto);
		
	}

	@Override
	public void deleteFile(int num, HttpServletRequest request) {
		HyrQnaDto dto=qnaDao.getData(num);
		//파일 시스템에서 삭제
		String saveFileName=dto.getSaveFileName();
		String path=request.getServletContext().getRealPath("/upload")+
				File.separator+saveFileName;
		new File(path).delete();
		qnaDao.delete(num);
		
	}

	@Override
	public void updateContent(HyrQnaDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getData(HttpServletRequest request) {
		//수정할 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//수정할 글의 정보 얻어와서 
		HyrQnaDto dto=qnaDao.getData(num);
		//request 에 담아준다.
		request.setAttribute("dto", dto);
		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		HyrQnaDto dto=qnaDao.getData(num);
		request.setAttribute("dto", dto);
		
	}

	@Override
	public void saveReply(HttpServletRequest request) {
		int ref_num=Integer.parseInt(request.getParameter("ref_num"));
		String content=request.getParameter("content");
		
		String writer=(String)request.getSession().getAttribute("id");
		int seq=qnaReplyDao.getSequence();
		HyrQnaReplyDto dto=new HyrQnaReplyDto();
		dto.setRnum(seq);
		dto.setWriter(writer);
		dto.setContent(content);
		dto.setRef_num(ref_num);
		qnaReplyDao.insert(dto);
	}

	@Override
	public void deleteReply(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("rnum"));
		HyrQnaReplyDto dto=qnaReplyDao.getData(num);
		String id=(String)request.getSession().getAttribute("id");
		qnaReplyDao.delete(num);
	}

	@Override
	public void updateReply(HyrQnaReplyDto dto) {
		qnaReplyDao.update(dto);
		
	}
	
}
