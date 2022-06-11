/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		CNT                           		NUMBER(10)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL
);

COMMENT ON TABLE CART is '쇼핑카트';
COMMENT ON COLUMN CART.CARTNO is '쇼핑카트 번호';
COMMENT ON COLUMN CART.CONTENTSNO is '컨텐츠 번호(상품 번호)';
COMMENT ON COLUMN CART.MEMBERNO is '회원 번호';
COMMENT ON COLUMN CART.CNT is '수량';
COMMENT ON COLUMN CART.RDATE is '날짜';

/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 맥북 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		MEMBERNO                      		NUMBER(10)		 NULL 		 PRIMARY KEY
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.MEMBERNO is '회원 번호';

/**********************************/
/* Table Name: 리뷰 */
/**********************************/
drop table review;
CREATE TABLE REVIEW(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rdate                         		DATE		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		passwd                        		VARCHAR2(15)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO),
  FOREIGN KEY (MEMBERNO) REFERENCES member (MEMBERNO)
);

COMMENT ON TABLE REVIEW is '리뷰';
COMMENT ON COLUMN REVIEW.reviewno is '리뷰번호';
COMMENT ON COLUMN REVIEW.rdate is '날짜';
COMMENT ON COLUMN REVIEW.name is '이름';
COMMENT ON COLUMN REVIEW.content is '내용';
COMMENT ON COLUMN REVIEW.passwd is '비밀번호';
COMMENT ON COLUMN REVIEW.file1 is '이미지';
COMMENT ON COLUMN REVIEW.file1saved is '실제 저장된 이미지';
COMMENT ON COLUMN REVIEW.thumb1 is '이미지 Preview';
COMMENT ON COLUMN REVIEW.size1 is '이미지 크기';
COMMENT ON COLUMN REVIEW.CONTENTSNO is '컨텐츠번호';
COMMENT ON COLUMN REVIEW.MEMBERNO is '회원 번호';


