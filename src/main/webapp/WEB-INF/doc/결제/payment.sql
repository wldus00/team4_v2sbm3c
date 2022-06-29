/**********************************/
/* Table Name: 노트북 */
/**********************************/
CREATE TABLE NBGRP(
		NBGRPNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL
);

COMMENT ON TABLE NBGRP is '노트북';
COMMENT ON COLUMN NBGRP.NBGRPNO is '노트북 그룹 번호';
COMMENT ON COLUMN NBGRP.NAME is '이름';
COMMENT ON COLUMN NBGRP.RDATE is '그룹 생성일';


/**********************************/
/* Table Name: 노트북 종류 */
/**********************************/
CREATE TABLE NBTYPE(
		NBNO                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NBGRPNO                       		NUMBER(10)		 NOT NULL,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (NBGRPNO) REFERENCES NBGRP (NBGRPNO)
);

COMMENT ON TABLE NBTYPE is '노트북 종류';
COMMENT ON COLUMN NBTYPE.NBNO is '노트북 번호';
COMMENT ON COLUMN NBTYPE.NBGRPNO is '노트북 그룹 번호';
COMMENT ON COLUMN NBTYPE.NAME is '기능별이름';
COMMENT ON COLUMN NBTYPE.RDATE is '등록일';

commit;
/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
DELETE FROM CONTENTS;
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NBNO                          		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB(4000)		 NOT NULL,
		RECOM                         		NUMBER(7)		 NOT NULL,
		CNT                           		NUMBER(7)		 NOT NULL,
		PASSWD                        		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		RDATE                         		DATE		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE1SAVED                    		VARCHAR2(100)		 NULL ,
		THUMB1                        		VARCHAR2(100)		 NULL ,
		SIZE1                         		NUMBER(10)		 NULL ,
		PRICE                         		NUMBER(10)		 NULL ,
		DC                            		NUMBER(10)		 NULL ,
		SALEPRICE                     		NUMBER(10)		 NULL ,
		POINT                         		NUMBER(10)		 NULL ,
		SALECNT                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (NBNO) REFERENCES NBTYPE (NBNO)
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 맥북 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.NBNO is '노트북 번호';
COMMENT ON COLUMN CONTENTS.TITLE is '상품명';
COMMENT ON COLUMN CONTENTS.CONTENT is '내용';
COMMENT ON COLUMN CONTENTS.RECOM is '추천수';
COMMENT ON COLUMN CONTENTS.CNT is '조회수';
COMMENT ON COLUMN CONTENTS.PASSWD is '패스워드';
COMMENT ON COLUMN CONTENTS.WORD is '검색어';
COMMENT ON COLUMN CONTENTS.RDATE is '등록일';
COMMENT ON COLUMN CONTENTS.FILE1 is '메인 이미지';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '실제 저장된 메인 이미지';
COMMENT ON COLUMN CONTENTS.THUMB1 is '메인 이미지 Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '메인 이미지 크기';
COMMENT ON COLUMN CONTENTS.PRICE is '정가';
COMMENT ON COLUMN CONTENTS.DC is '할인률';
COMMENT ON COLUMN CONTENTS.SALEPRICE is '판매가';
COMMENT ON COLUMN CONTENTS.POINT is '포인트';
COMMENT ON COLUMN CONTENTS.SALECNT is '수량';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PW                            		VARCHAR2(60)		 NOT NULL,
		USERNAME                      		VARCHAR2(30)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(50)		 NOT NULL,
		ADDRESS1                      		VARCHAR2(200)		 NOT NULL,
		ADDRESS2                      		VARCHAR2(200)		 NOT NULL,
		GENDER                        		VARCHAR2(10)		 NULL ,
		BIRTH                         		DATE		 NOT NULL,
		TEL                           		VARCHAR2(20)		 NULL ,
		SIGNDATE                      		DATE		 NOT NULL,
  CONSTRAINT SYS_C008076 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PW is '비밀번호';
COMMENT ON COLUMN MEMBER.USERNAME is '회원명';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.GENDER is '성별';
COMMENT ON COLUMN MEMBER.BIRTH is '생년월일';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.SIGNDATE is '가입일';


/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE CART is '쇼핑카트';
COMMENT ON COLUMN CART.CARTNO is '쇼핑카트 번호';
COMMENT ON COLUMN CART.CONTENTSNO is '컨텐츠 번호(상품 번호)';
COMMENT ON COLUMN CART.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CART.CNT is '수량';
COMMENT ON COLUMN CART.RDATE is '날짜';


/**********************************/
/* Table Name: 주문_결재 */
/**********************************/
DROP TABLE ORDER_PAY;
DELETE FROM ORDER_PAY;
CREATE TABLE ORDER_PAY(
		ORDER_PAYNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		RNAME                         		VARCHAR2(30)		 NOT NULL,
		RTEL                          		VARCHAR2(20)		 NOT NULL,
		RZIPCODE                      		VARCHAR2(50)		 NULL ,
		RADDRESS1                     		VARCHAR2(200)		 NOT NULL,
		RADDRESS2                     		VARCHAR2(200)		 NOT NULL,
		PAYTYPE                       		NUMBER(1)	DEFAULT 0	 NOT NULL,
		AMOUNT                        		NUMBER(10)	DEFAULT 0	 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE ORDER_PAY is '주문_결재';
COMMENT ON COLUMN ORDER_PAY.ORDER_PAYNO is '주문 번호';
COMMENT ON COLUMN ORDER_PAY.MEMBERNO is '회원 번호';
COMMENT ON COLUMN ORDER_PAY.RNAME is '수취인성명';
COMMENT ON COLUMN ORDER_PAY.RTEL is '수취인 전화번호';
COMMENT ON COLUMN ORDER_PAY.RZIPCODE is '수취인 우편번호';
COMMENT ON COLUMN ORDER_PAY.RADDRESS1 is '수취인 주소1';
COMMENT ON COLUMN ORDER_PAY.RADDRESS2 is '수취인 주소2';
COMMENT ON COLUMN ORDER_PAY.PAYTYPE is '결재 종류';
COMMENT ON COLUMN ORDER_PAY.AMOUNT is '결재금액';
COMMENT ON COLUMN ORDER_PAY.RDATE is '주문날짜';

DROP SEQUENCE ORDER_PAY_seq;
CREATE SEQUENCE ORDER_PAY_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 주문상세 */
/**********************************/
DROP TABLE ORDER_ITEM;
DELETE FROM ORDER_ITEM;
CREATE TABLE ORDER_ITEM(
		ORDER_ITEMNO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		ORDER_PAYNO                   		NUMBER(10)		 NOT NULL,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		CNT                           		NUMBER(5)	DEFAULT 1  NOT NULL,
		TOT                           		NUMBER(10)	DEFAULT 0	 NOT NULL,
		STATENO                       		NUMBER(1)	DEFAULT 0	 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (ORDER_PAYNO) REFERENCES ORDER_PAY (ORDER_PAYNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE ORDER_ITEM is '주문상세';
COMMENT ON COLUMN ORDER_ITEM.ORDER_ITEMNO is '주문상세번호';
COMMENT ON COLUMN ORDER_ITEM.MEMBERNO is '회원 번호';
COMMENT ON COLUMN ORDER_ITEM.ORDER_PAYNO is '주문 번호';
COMMENT ON COLUMN ORDER_ITEM.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN ORDER_ITEM.CNT is '수량';
COMMENT ON COLUMN ORDER_ITEM.TOT is '합계';
COMMENT ON COLUMN ORDER_ITEM.STATENO is '주문상태';
COMMENT ON COLUMN ORDER_ITEM.RDATE is '주문날짜';

DROP SEQUENCE ORDER_ITEM_seq;
CREATE SEQUENCE ORDER_ITEM_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지
