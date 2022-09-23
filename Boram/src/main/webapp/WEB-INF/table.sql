
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
	regdate DATE,
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




--ALTER TABLE users ADD(saveId CHAR(1));
--ALTER TABLE users ADD CHECK (saveId IN('Y','N'));

--UPDATE users Set saveid='H' WHERE id='hahaha';

--select *
--from user_constraints
--where table_name='USERS'

--alter table users
--drop constraint SYS_C0015017
CREATE TABLE categorize(
   category VARCHAR2(100) PRIMARY KEY
);


INSERT INTO categorize(category) VALUES('clothes');

INSERT INTO categorize(category) VALUES('bedding');

INSERT INTO categorize(category) VALUES('shoes');

INSERT INTO categorize(category) VALUES('living');


CREATE TABLE items(
   inum NUMBER PRIMARY KEY,
   item VARCHAR2(100) NOT NULL,
   price NUMBER NOT NULL,
   category VARCHAR2(20) CONSTRAINT items_category_fk REFERENCES categorize(category)
);
   
CREATE SEQUENCE items_seq;
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '셔츠', 1800, 'clothes');

INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '면(티셔츠, 맨투맨, 후드티)', 4000, 'clothes');

INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '니트, 스웨터, 가디건', 5000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '자켓, 점퍼', 5000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '모자', 4000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '가죽', 10900, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '바지, 스커트', 3500, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '패딩', 8000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '목도리, 스카프, 장갑', 4000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '코트', 12000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '원피스', 6000, 'clothes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '일반이불', 12000, 'bedding');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '극세사이불', 16000, 'bedding');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '오리, 거위털이불', 22000, 'bedding');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '운동화', 5500, 'shoes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '구두, 로퍼', 7000, 'shoes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '부츠', 15000, 'shoes');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '카페트', 50000, 'living');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '러그', 20000, 'living');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '커튼', 15000, 'living');
   
INSERT INTO items
   (inum, item, price, category)
   VALUES(items_seq.NEXTVAL, '인형', 7000, 'living');
   
   
   
CREATE TABLE service_order(
   code NUMBER PRIMARY KEY,
   orderer VARCHAR2(100) NOT NULL,
   category VARCHAR2(20) NOT NULL,
   order_price NUMBER NOT NULL, --총 주문 가격
   order_addr VARCHAR2(100) NOT NULL,
   regdate DATE NOT NULL,
   reservation_date VARCHAR2(100) NOT NULL, --예약날짜
   request VARCHAR2(500), -- 요구사항, 글자수 제한
   state VARCHAR2(50) CHECK(type IN ('예약완료', '수거중', '수거완료', '세탁중', '세탁완료', '반환중','반환완료')),
   get_invoice_num NUMBER, -- 수거용  번호
   send_invoice_num NUMBER -- 반환용 운송장 번호
   );
   
CREATE SEQUENCE service_order_seq;
   
CREATE TABLE order_items(
   num NUMBER PRIMARY KEY,
   code NUMBER NOT NULL,
   inum NUMBER NOT NULL,
   count NUMBER NOT NULL -- 수량
   );