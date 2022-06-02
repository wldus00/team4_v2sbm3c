/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';


/**********************************/
/* Table Name: 노트북 종류 */
/**********************************/
CREATE TABLE nbfunction(
		nbno                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE nbfunction is '노트북 종류';
COMMENT ON COLUMN nbfunction.nbno is '노트북 번호';


/**********************************/
/* Table Name: 관심분야 */
/**********************************/
CREATE TABLE FAVORITE(
		FAVORITENO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		RDATE                         		DATE		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		nbno                          		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (nbno) REFERENCES nbtype (nbno)
);

COMMENT ON TABLE FAVORITE is '관심분야';
COMMENT ON COLUMN FAVORITE.FAVORITENO is '관심분야번호';
COMMENT ON COLUMN FAVORITE.SEQNO is '출력순서';
COMMENT ON COLUMN FAVORITE.RDATE is '등록일';
COMMENT ON COLUMN FAVORITE.MEMBERNO is '회원 번호';
COMMENT ON COLUMN FAVORITE.nbno is '노트북 번호';


/**********************************/
/* Table Name: 컨텐츠 - 맥북 상품 */
/**********************************/
CREATE TABLE CONTENTS(
		CONTENTSNO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbno                          		NUMBER(10)		 NULL ,
  FOREIGN KEY (nbno) REFERENCES nbfunction (nbno)
);

COMMENT ON TABLE CONTENTS is '컨텐츠 - 맥북 상품';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '컨텐츠 번호';
COMMENT ON COLUMN CONTENTS.nbno is '노트북 번호';


/**********************************/
/* Table Name: 추천상품 */
/**********************************/
CREATE TABLE RECOMMEND(
		RECOMMENDNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		RDATE                         		DATE		 NULL ,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE RECOMMEND is '추천상품';
COMMENT ON COLUMN RECOMMEND.RECOMMENDNO is '추천상품번호';
COMMENT ON COLUMN RECOMMEND.SEQNO is '출력 순서';
COMMENT ON COLUMN RECOMMEND.RDATE is '등록일';
COMMENT ON COLUMN RECOMMEND.MEMBERNO is '회원 번호';
COMMENT ON COLUMN RECOMMEND.CONTENTSNO is '컨텐츠 번호';


/**********************************/
/* Table Name: 평점 */
/**********************************/
CREATE TABLE RATINGS(
		RATINGSNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SCORE                         		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		MEMBERNO                      		NUMBER(10)		 NULL ,
		CONTENTSNO                    		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (CONTENTSNO) REFERENCES CONTENTS (CONTENTSNO)
);

COMMENT ON TABLE RATINGS is '평점';
COMMENT ON COLUMN RATINGS.RATINGSNO is '평점 번호';
COMMENT ON COLUMN RATINGS.SCORE is '평점';
COMMENT ON COLUMN RATINGS.rdate is '등록일';
COMMENT ON COLUMN RATINGS.MEMBERNO is '회원 번호';
COMMENT ON COLUMN RATINGS.CONTENTSNO is '컨텐츠 번호';


