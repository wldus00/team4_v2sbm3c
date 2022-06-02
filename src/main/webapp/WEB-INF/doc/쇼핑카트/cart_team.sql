/**********************************/
/* Table Name: 노트북컨텐츠  */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbno                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE CONTENTS is '노트북컨텐츠 ';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '상품 번호';
COMMENT ON COLUMN CONTENTS.nbno is '카테고리 번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
  CONSTRAINT SYS_C007427 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';


/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

COMMENT ON TABLE CART is '쇼핑카트';
COMMENT ON COLUMN CART.CARTNO is '쇼핑카트 번호';
COMMENT ON COLUMN CART.CONTENTSNO is '컨텐츠 번호(상품 번호)';
COMMENT ON COLUMN CART.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CART.CNT is '수량';
COMMENT ON COLUMN CART.RDATE is '날짜';


/**********************************/
/* Table Name: MEMBER */
/**********************************/
CREATE TABLE TABLE_5(
		MEMBERNO                      		NUMBER(10)		 NULL 		 PRIMARY KEY
);

COMMENT ON TABLE TABLE_5 is 'MEMBER';
COMMENT ON COLUMN TABLE_5.MEMBERNO is 'MEMBERNO';


/**********************************/
/* Table Name: CONTENTS */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbno                          		NUMBER(10)		 NULL 
);

COMMENT ON TABLE CONTENTS is 'CONTENTS';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is 'CONTENTSNO';
COMMENT ON COLUMN CONTENTS.nbno is 'nbno';


/**********************************/
/* Table Name: CART */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES TABLE_5 (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE CART is 'CART';
COMMENT ON COLUMN CART.CARTNO is 'CARTNO';
COMMENT ON COLUMN CART.CONTENTSNO is 'CONTENTSNO';
COMMENT ON COLUMN CART.MEMBERNO is 'MEMBERNO';
COMMENT ON COLUMN CART.CNT is 'CNT';
COMMENT ON COLUMN CART.RDATE is 'RDATE';


