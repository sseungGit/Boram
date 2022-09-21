-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate DATE -- 가입일
);

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



CREATE TABLE review_board_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(100), --댓글 작성자의 아이디
	content VARCHAR2(500), --댓글 내용
	target_id VARCHAR2(100), --댓글의 대상자 아이디
	ref_group NUMBER,
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

CREATE SEQUENCE review_board_comment_seq;

-- 공지게시판 만들기 위한 테이블 
CREATE TABLE notice_board(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(100), -- 이미지에 대한 설명
	imagePath VARCHAR2(100) -- 업로드된 이미지의 경로  ex) /upload/xxx.jpg
);

CREATE SEQUENCE notice_board_seq;

-- 질문게시판을 만들기 위한 테이블
CREATE TABLE qna_board(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	category VARCHAR2(20)
);

CREATE SEQUENCE qna_board_seq; 

-- 1:1문의 
CREATE TABLE question_board(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
);

CREATE SEQUENCE question_board_seq; 




--ALTER TABLE users ADD(saveId CHAR(1));

--ALTER TABLE users ADD CHECK (saveId IN('Y','N'));

--UPDATE users Set saveid='H' WHERE id='hahaha';

--select *
--from user_constraints
--where table_name='USERS'

--alter table users
--drop constraint SYS_C0015017







