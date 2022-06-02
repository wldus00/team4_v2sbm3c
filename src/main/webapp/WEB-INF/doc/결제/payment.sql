/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		INTEGER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';


/**********************************/
/* Table Name: 주문 결제 */
/**********************************/
CREATE TABLE payment(
		purchaseno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		number(10)		 NOT NULL,
		PAYMENTMANE                   		VARCHAR2(30)		 NOT NULL,
		AMOUNTOFPAYMENT               		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE payment is '주문 결제';
COMMENT ON COLUMN payment.purchaseno is '구매 번호';
COMMENT ON COLUMN payment.MEMBERNO is '회원 번호';
COMMENT ON COLUMN payment.PAYMENTMANE is '결재인 이름';
COMMENT ON COLUMN payment.AMOUNTOFPAYMENT is '총 결제 금액';



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


/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		NBNO                          		NUMBER(10)		 NULL ,
  FOREIGN KEY (NBNO) REFERENCES NBTYPE (NBNO)
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 맥북 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.NBNO is '노트북 번호';


/**********************************/
/* Table Name: 구매 기록 */
/**********************************/
CREATE TABLE purchaseRecord(
		purchaseno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		PURCHASECNT                    		NUMBER(10) DEFAULT 0 NOT NULL,		 
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE purchaseRecord is '구매 기록';
COMMENT ON COLUMN purchaseRecord.purchaseno is '구매 번호';
COMMENT ON COLUMN purchaseRecord.MEMBERNO is '회원 번호';
COMMENT ON COLUMN purchaseRecord.RDATE is '구매날짜';
COMMENT ON COLUMN purchaseRecord.PURCHASECNT is '구매수량';
COMMENT ON COLUMN purchaseRecord.CONTENTSNO is '컨텐츠 번호';


/**********************************/
/* Table Name: 주문 상세 */
/**********************************/
CREATE TABLE order_details(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		purchaseno                    		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		PURCHASECNT                    		NUMBER(10) DEFAULT 0 NOT NULL,		
  FOREIGN KEY (purchaseno) REFERENCES payment (purchaseno),
  FOREIGN KEY (purchaseno) REFERENCES purchaseRecord (purchaseno),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE order_details is '주문 상세';
COMMENT ON COLUMN order_details.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN order_details.MEMBERNO is '회원 번호';
COMMENT ON COLUMN order_details.purchaseno is '구매 번호';
COMMENT ON COLUMN order_details.RDATE is '구매날짜';
COMMENT ON COLUMN order_details.PURCHASENO is '구매수량';

COMMIT;

