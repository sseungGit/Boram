CREATE TABLE users(
id VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
name VARCHAR2(100) NOT NULL,
countryCode NUMBER,
phone VARCHAR2(100),
email VARCHAR2(100),
profile VARCHAR2(100),
addr VARCHAR2(100),
regdate DATE,
manager CHAR(1) CHECK(manager IN ('Y', 'N')) 
)

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
   state VARCHAR2(50) CHECK(state IN ('예약완료', '수거중', '수거완료', '세탁중', '세탁완료', '반환중','반환완료')),
   get_invoice_num NUMBER, -- 수거용 운송장 번호
   send_invoice_num NUMBER -- 반환용 운송장 번호
   );
   
CREATE TABLE order_items(
   num NUMBER PRIMARY KEY,
   code NUMBER NOT NULL,
   inum NUMBER NOT NULL,
   count NUMBER NOT NULL -- 수량
   );
   
CREATE SEQUENCE order_items_seq;