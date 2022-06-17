-- 기존 테이블 삭제하기
DROP TABLE member CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE Member(
		MEMBERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR(20)		 NOT NULL UNIQUE,
		PW                            		VARCHAR(60)		 NOT NULL,
		UserName                      		VARCHAR(30)		 NOT NULL,
        zipcode                             VARCHAR(50)      NOT NULL,
        Address1                             VARCHAR(200)      NOT NULL,
        Address2                             VARCHAR(200)      NOT NULL,
		Gender                        		VARCHAR(10)		 NULL ,
		Birth                         		DATE		 NOT NULL,
		Tel                           		VARCHAR(20)		 NULL ,
		SignDate                      		DATE		 NOT NULL
);
-- 등급 컬럼 추가하기
alter table member add grade number(10) Default 20 not null;

commit;

COMMENT ON TABLE Member is '회원';
COMMENT ON COLUMN Member.MEMBERNO is '회원번호';
COMMENT ON COLUMN Member.ID is '아이디';
COMMENT ON COLUMN Member.PW is '비밀번호';
COMMENT ON COLUMN Member.UserName is '회원명';
COMMENT ON COLUMN Member.zipcode is '우편번호';
COMMENT ON COLUMN Member.Address1 is '주소1';
COMMENT ON COLUMN Member.Address2 is '주소2';
COMMENT ON COLUMN Member.Gender is '성별';
COMMENT ON COLUMN Member.Birth is '생년월일';
COMMENT ON COLUMN Member.Tel is '전화번호';
COMMENT ON COLUMN Member.SignDate is '가입일';

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE Admin(
		ID                            		VARCHAR2(15)		 NULL 		 PRIMARY KEY,
		PW                            		VARCHAR2(20)		 NOT NULL,
		AdminNo                       		NUMBER(10)		 NOT NULL,
		AdminName                     		VARCHAR2(10)		 NOT NULL
);

/* 관리자 목록*/
select * from Admin order by Adminno;
/* 관리자 가입 */
insert into Admin values('ID', 'PW', Admin_seq.nextval, '관리자명');
/* 관리자 정보 수정 */
update Admin set pw='변경 비밀번호' where ID = '관리자ID';
/* 관리자 삭제(탈퇴)*/
delete Admin where ID = '관리자ID';
/* 관리자 인수*/
select count(*) from Admin;

COMMENT ON TABLE Admin is '관리자';
COMMENT ON COLUMN Admin.ID is '아이디';
COMMENT ON COLUMN Admin.PW is '비밀번호';
COMMENT ON COLUMN Admin.AdminNo is '관리자번호';
COMMENT ON COLUMN Admin.AdminName is '관리자이름';

CREATE SEQUENCE Admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 게시글 */
/**********************************/
CREATE TABLE bulletin(
        bulletinno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        memberno                             NUMBER(10)         NOT NULL ,
        Title                                  VARCHAR2(50)         NOT NULL,
        Contents                      		VARCHAR(500)		 NULL,
		bDate                          		DATE		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);
drop table bulletin;
/* 글 목록*/
select * from bulletin order by bulletinno;
/* 글 검색*/
select * from bulletin where title like '%검색 키워드%' order by bulletinno;
/* 글 작성 */
insert into bulletin values(bulletin_seq.nextval, '회원번호', '글 제목', '내용', sysdate);
/* 글 수정 */
update bulletin set title='변경 제목', contents='변경 내용' where bulletinno = '글 번호';
/* 글 삭제*/
delete bulletin where bulletinno = '글 번호';
/* 글 갯수*/
select count(*) from bulletin;

COMMENT ON TABLE bulletin is '게시글';
COMMENT ON COLUMN bulletin.bulletinNo is '글 번호';
COMMENT ON COLUMN bulletin.MEMBERNO is '회원번호';
COMMENT ON COLUMN bulletin.Title is '제목';
COMMENT ON COLUMN bulletin.Contents is '내용';
COMMENT ON COLUMN bulletin.bDate is '작성일';

DROP SEQUENCE bulletin_seq;
CREATE SEQUENCE bulletin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


/**********************************/
/* Table Name: 내역 */
/**********************************/
CREATE TABLE BreakDown(
		BreakDownNO                   		NUMBER(10)		 NULL 		 PRIMARY KEY,
		memberno                            		NUMBER(10)		 NOT NULL,
		Classification                		VARCHAR2(10)		 NOT NULL,
		Title                         		VARCHAR2(30)		 NOT NULL,
		bdDate                          		DATE		 NOT NULL,
		bulletinNo                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (bulletinNo) REFERENCES bulletin (bulletinNo)
);
drop table breakdown;
/* 내역 목록*/
select * from BreakDown order by BreakDownNO;
/* 내역 검색*/
select * from BreakDown where title like '%검색 키워드%' order by BreakDownNO;
/* 내역 삭제*/
delete BreakDown where BreakDownno = '내역 번호';
/* 내역 갯수*/
select count(*) from BreakDown;

COMMENT ON TABLE BreakDown is '내역';
COMMENT ON COLUMN BreakDown.MEMBERNO is '회원번호';
COMMENT ON COLUMN BreakDown.BreakDownNO is '내역번호';
COMMENT ON COLUMN BreakDown.Classification is '분류';
COMMENT ON COLUMN BreakDown.Title is '제목';
COMMENT ON COLUMN BreakDown.bdDate is '일자';
COMMENT ON COLUMN BreakDown.bulletinNo is '글 번호';

DROP SEQUENCE BreakDown_seq;
CREATE SEQUENCE BreakDown_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
