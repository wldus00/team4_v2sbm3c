/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE notice;
CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEMBERNO                      		NUMBER(10)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		notice_cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file1saved                    		VARCHAR2(100)		 NULL ,
		thumb1                        		VARCHAR2(100)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NOT NULL
);
alter table member add replycnt NUMBER(7) Default 0 NOT NULL;
alter table member add notice_cnt NUMBER(7) Default 0 NOT NULL;

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항번호';
COMMENT ON COLUMN notice.MEMBERNO is '회원 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.replycnt is '댓글수';
COMMENT ON COLUMN notice.notice_cnt is '조회수';
COMMENT ON COLUMN notice.file1 is '메인 이미지';
COMMENT ON COLUMN notice.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN notice.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.size1 is '파일 사이즈';
COMMENT ON COLUMN notice.rdate is '등록일';

DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO                      		INTEGER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.MEMBERNO is '회원 번호';


/**********************************/
/* Table Name: 댓글 */
/**********************************/
DROP TABLE REPLY;
CREATE TABLE REPLY(
		REPLYNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		noticeno                      		NUMBER(10)		 NULL ,
		MEMBERNO                      		NUMBER(6)		 NOT NULL,
		CONTENT                       		VARCHAR2(1000)		 NOT NULL,
		PASSWD                        		VARCHAR2(20)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

COMMENT ON TABLE REPLY is '댓글';
COMMENT ON COLUMN REPLY.REPLYNO is '댓글번호';
COMMENT ON COLUMN REPLY.noticeno is '공지사항번호';
COMMENT ON COLUMN REPLY.MEMBERNO is '회원 번호';
COMMENT ON COLUMN REPLY.CONTENT is '내용';
COMMENT ON COLUMN REPLY.PASSWD is '비밀번호';
COMMENT ON COLUMN REPLY.RDATE is '등록일';

DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999
  CACHE 2                     -- 2번은 메모리에서만 계산
  NOCYCLE;                   -- 다시 1부터 생성되는 것을 방지


