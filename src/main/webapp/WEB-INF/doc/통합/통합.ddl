/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE User(
		MEMBERNO NUMERIC(10) NOT NULL PRIMARY KEY,
		ID VARCHAR(15) NOT NULL,
		PW VARCHAR2(20) NOT NULL,
		UserName VARCHAR2(10) NOT NULL,
		Gender VARCHAR2(10),
		Birth DATE NOT NULL,
		Tel VARCHAR2(20),
		SignDate DATE NOT NULL,
  CONSTRAINT ID UNIQUE ()
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE Admin(
		ID VARCHAR2(15) PRIMARY KEY,
		PW VARCHAR2(20) NOT NULL,
		AdminNo NUMBER(10) NOT NULL,
		AdminName VARCHAR2(10) NOT NULL
);

/**********************************/
/* Table Name: 게시글 */
/**********************************/
CREATE TABLE Writing(
		WritingNo INTEGER(10) PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		Title VARCHAR2(30) NOT NULL,
		Contents VARCHAR2(500),
		Date DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO)
);

/**********************************/
/* Table Name: 내역 */
/**********************************/
CREATE TABLE BreakDown(
		BreakDownNO NUMBER(10) PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		Classification VARCHAR2(10) NOT NULL,
		Title VARCHAR2(30) NOT NULL,
		Date DATE NOT NULL,
		WritingNo INTEGER(10),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO),
  FOREIGN KEY (WritingNo) REFERENCES Writing (WritingNo)
);

/**********************************/
/* Table Name: 노트북 */
/**********************************/
CREATE TABLE nbgrp(
		nbgrpno NUMBER(10) NOT NULL PRIMARY KEY,
		name VARCHAR2(50) NOT NULL,
		rdate DATE NOT NULL
);

/**********************************/
/* Table Name: 노트북 종류 */
/**********************************/
CREATE TABLE nbtype(
		nbno NUMBER(10) NOT NULL PRIMARY KEY,
		nbgrpno NUMBER(10) NOT NULL,
		name VARCHAR2(50) NOT NULL,
		rdate DATE NOT NULL,
  FOREIGN KEY (nbgrpno) REFERENCES nbgrp (nbgrpno)
);

/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO NUMBER(10) NOT NULL PRIMARY KEY,
		nbno NUMBER(10) NOT NULL,
		TITLE VARCHAR2(300) NOT NULL,
		CONTENT CLOB(4000) NOT NULL,
		RECOM NUMBER(7) NOT NULL,
		CNT NUMBER(7) NOT NULL,
		PASSWD VARCHAR2(15) NOT NULL,
		WORD VARCHAR2(300),
		RDATE DATE NOT NULL,
		FILE1 VARCHAR2(100),
		FILE1SAVED VARCHAR2(100),
		THUMB1 VARCHAR2(100),
		SIZE1 NUMBER(10),
		PRICE NUMBER(10),
		DC NUMBER(10),
		SALEPRICE NUMBER(10),
		POINT NUMBER(10),
		SALECNT NUMBER(10),
  FOREIGN KEY (nbno) REFERENCES nbtype (nbno)
);

/**********************************/
/* Table Name: 관심분야 */
/**********************************/
CREATE TABLE FAVORITE(
		FAVORITENO NUMBER(10) NOT NULL PRIMARY KEY,
		SEQNO NUMBER(7) NOT NULL,
		RDATE DATE,
		MEMBERNO NUMBER(10) NOT NULL,
		nbno NUMBER(10),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO),
  FOREIGN KEY (nbno) REFERENCES nbtype (nbno)
);

/**********************************/
/* Table Name: 추천상품 */
/**********************************/
CREATE TABLE RECOMMEND(
		RECOMMENDNO NUMBER(10) NOT NULL PRIMARY KEY,
		SEQNO NUMBER(7) NOT NULL,
		RDATE DATE,
		MEMBERNO NUMBER(10),
		CONTENTSNO NUMBER(10),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

/**********************************/
/* Table Name: 평점 */
/**********************************/
CREATE TABLE RATINGS(
		RATINGSNO NUMBER(10) NOT NULL PRIMARY KEY,
		SCORE NUMBER(10) DEFAULT 1 NOT NULL,
		rdate DATE NOT NULL,
		MEMBERNO NUMBER(10),
		CONTENTSNO NUMBER(10),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO)
);

/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO NUMBER(10) NOT NULL PRIMARY KEY,
		CONTENTSNO NUMBER(10),
		MEMBERNO NUMBER(10) NOT NULL,
		CNT NUMBER(10) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO)
);

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE REVIEW(
		reviewno NUMBER(10) NOT NULL PRIMARY KEY,
		rdate DATE NOT NULL,
		name VARCHAR2(50) NOT NULL,
		content CLOB(2000) NOT NULL,
		passwd VARCHAR2(15) NOT NULL,
		file1 VARCHAR2(100),
		file1saved VARCHAR2(100),
		thumb1 VARCHAR2(100),
		size1 NUMBER(10),
		CONTENTSNO NUMBER(10),
		MEMBERNO NUMBER(10),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO)
);

/**********************************/
/* Table Name: 주문 결제 */
/**********************************/
CREATE TABLE order_payment(
		PURCHASENO NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		RMANE NUMERIC(30) NOT NULL,
		RTEL VARCHAR(15) NOT NULL,
		RZIPCODE VARCHAR(5),
		RADDRESS VARCHAR(50) NOT NULL,
		BRADDRESS VARCHAR(30) NOT NULL,
		PAYTYPE NUMERIC(1) NOT NULL,
		AMOUNT NUMERIC(10) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO)
);

/**********************************/
/* Table Name: 구매 기록 */
/**********************************/
CREATE TABLE purchaseRecord(
		PURCHASENO NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		RDATE DATE NOT NULL,
		PURCHASECNT NUMERIC(100) NOT NULL,
		CONTENTSNO INTEGER(10) NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

/**********************************/
/* Table Name: 주문 상세 */
/**********************************/
CREATE TABLE order_details(
		ORDER_PRODUCT NUMERIC(10) NOT NULL PRIMARY KEY,
		CONTENTSNO NUMERIC(10),
		MEMBERNO NUMERIC(10),
		PURCHASENO NUMERIC(10) NOT NULL,
		CNT NUMERIC(5) NOT NULL,
		TOTEL NUMERIC(10) NOT NULL,
		STATENO NUMERIC(1) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES User (MEMBERNO),
  FOREIGN KEY (PURCHASENO) REFERENCES order_payment (PURCHASENO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (PURCHASENO) REFERENCES purchaseRecord (PURCHASENO)
);

