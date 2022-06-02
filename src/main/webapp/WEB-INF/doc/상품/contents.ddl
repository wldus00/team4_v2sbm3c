/**********************************/
/* Table Name: 노트북 */
/**********************************/
CREATE TABLE nbgrp(
		nbgrpno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE nbgrp is '노트북';
COMMENT ON COLUMN nbgrp.nbgrpno is '노트북 그룹 번호';
COMMENT ON COLUMN nbgrp.name is '이름';
COMMENT ON COLUMN nbgrp.rdate is '그룹 생성일';

CREATE SEQUENCE nbgrp_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 노트북 종류 */
/**********************************/
CREATE TABLE nbtype(
		nbno                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbgrpno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (nbgrpno) REFERENCES nbgrp (nbgrpno)
);

COMMENT ON TABLE nbtype is '노트북 종류';
COMMENT ON COLUMN nbtype.nbno is '노트북 번호';
COMMENT ON COLUMN nbtype.nbgrpno is '노트북 그룹 번호';
COMMENT ON COLUMN nbtype.name is '기능별이름';
COMMENT ON COLUMN nbtype.rdate is '등록일';

CREATE SEQUENCE nbtype_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbno                          		NUMBER(10)		 NOT NULL,
		TITLE                         		VARCHAR2(300)		 NOT NULL,
		CONTENT                       		CLOB  NOT NULL,
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
  FOREIGN KEY (nbno) REFERENCES nbtype (nbno)
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 맥북 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.nbno is '노트북 번호';
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

drop SEQUENCE contents_seq
CREATE SEQUENCE contents_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



