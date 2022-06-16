/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		INTEGER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';


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
/* Table Name: 주문 결제 */
/**********************************/
CREATE TABLE order_payment(
		PURCHASENO                    		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMERIC(10)		 NOT NULL,
		RMANE                         		NUMERIC(30)		 NOT NULL,
		RTEL                          		VARCHAR(15)		 NOT NULL,
		RZIPCODE                      		VARCHAR(5)		 NULL ,
		RADDRESS                      		VARCHAR(50)		 NOT NULL,
		BRADDRESS                     		VARCHAR(30)		 NOT NULL,
		PAYTYPE                       		NUMERIC(1)		 NOT NULL,
		AMOUNT                        		NUMERIC(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE order_payment is '주문 결제';
COMMENT ON COLUMN order_payment.PURCHASENO is '주문 번호';
COMMENT ON COLUMN order_payment.MEMBERNO is '회원 번호';
COMMENT ON COLUMN order_payment.RMANE is '수령자 이름';
COMMENT ON COLUMN order_payment.RTEL is '수령자 전화번호';
COMMENT ON COLUMN order_payment.RZIPCODE is '수령자 우편번호';
COMMENT ON COLUMN order_payment.RADDRESS is '수령자 주소';
COMMENT ON COLUMN order_payment.BRADDRESS is '수령자 상세주소';
COMMENT ON COLUMN order_payment.PAYTYPE is '결재 종류';
COMMENT ON COLUMN order_payment.AMOUNT is '총 결제 금액';
COMMENT ON COLUMN order_payment.RDATE is '주문날짜';

DROP SEQUENCE order_payment_seq;

CREATE SEQUENCE order_payment_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 주문 상세 */
/**********************************/
CREATE TABLE order_details(
		ORDER_PRODUCT                 		NUMERIC(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMERIC(10)		 NULL ,
		MEMBERNO                      		NUMERIC(10)		 NULL ,
		PURCHASENO                    		NUMERIC(10)		 NOT NULL,
		CNT                           		NUMERIC(5)		 NOT NULL,
		TOTEL                         		NUMERIC(10)		 NOT NULL,
		STATENO                       		NUMERIC(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (PURCHASENO) REFERENCES order_payment (PURCHASENO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE order_details is '주문 상세';
COMMENT ON COLUMN order_details.ORDER_PRODUCT is '주문상세번호';
COMMENT ON COLUMN order_details.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN order_details.MEMBERNO is '회원 번호';
COMMENT ON COLUMN order_details.PURCHASENO is '주문 번호';
COMMENT ON COLUMN order_details.CNT is '상품수량';
COMMENT ON COLUMN order_details.TOTEL is '상품합계';
COMMENT ON COLUMN order_details.STATENO is '주문상태';
COMMENT ON COLUMN order_details.RDATE is '주문날짜';

DROP SEQUENCE order_details_seq;

CREATE SEQUENCE order_details_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
