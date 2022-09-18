
-- 리뷰게시글을 저장할 테이블 
CREATE TABLE review_board(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE, --글 작성일
	star NUMBER --별점
);
-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE review_board_seq; 

-- 공지게시판 만들기 위한 테이블 
CREATE TABLE notice_board(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(100), -- 이미지에 대한 설명
	imagePath VARCHAR2(100) -- 업로드된 이미지의 경로  ex) /upload/xxx.jpg
);

CREATE SEQUENCE notice_board_seq;

-- 자주묻는 질문
CREATE TABLE faq_board(
	num NUMBER PRIMARY KEY,
	category VARCHAR2(20),
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --질문
	content CLOB, --답변 내용
	regdate DATE,
	update_date DATE
	
);

CREATE SEQUENCE faq_seq; 

-- 1:1문의 
CREATE TABLE qna_board(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글(질문) 내용
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL -- 파일의 크기 
);

CREATE SEQUENCE qna_seq; 

CREATE TABLE reply_board(
	rnum NUMBER PRIMARY KEY,
	ref_num NUMBER NOT NULL,
	writer VARCHAR2(100),
	content CLOB,
	regdate DATE,
	update_date DATE
);

CREATE SEQUENCE reply_seq;

--sample 자주묻는질문 데이터
INSERT INTO faq_board (num,category,title,content)
values(faq_seq.nextval,'회원정보','회원정보를 바꾸고 싶습니다','마이페이지에서 회원정보를 직접 변경할 수 있습니다.');












