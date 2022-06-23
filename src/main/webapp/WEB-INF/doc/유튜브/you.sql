/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
DROP TABLE yt;
DROP TABLE ytgrp;
DROP TABLE ytgrp CASCADE CONSTRAINTS;
CREATE TABLE ytgrp(
        ytgrpno                             NUMBER(7)         NOT NULL         PRIMARY KEY,
       title                               VARCHAR2(50)         NOT NULL,
      cnt                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        visible                               CHAR(1)         DEFAULT 'Y'         NOT NULL,
        rdate                                 DATE         NOT NULL
);

COMMENT ON TABLE ytgrp is '카테고리';
COMMENT ON COLUMN you. ytgrpno is '카테고리그룹 번호';
COMMENT ON COLUMN you.title is '카테고리그룹 이름 ';
COMMENT ON COLUMN you. cnt is '관련자료';
COMMENT ON COLUMN you.visible is '등록일';
COMMENT ON COLUMN you.rdate is '날짜';


CREATE SEQUENCE ytgrp_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  -- 등록
INSERT INTO ytgrp(ytgrpno, title, cnt, visible, rdate)
VALUES(ytgrp_seq.nextval, '영화' , 1  , 'y' , sysdate)
SELECT * FROM ytgrp ORDER BY ytgrpno ASC;
/**********************************/
/* Table Name: 카테고리 */
/**********************************/

DROP TABLE you;
CREATE TABLE you(
         youno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
         title                                VARCHAR2(50)         NOT NULL,
        url                                  VARCHAR2(2000)         NOT NULL,
        rdate                                 DATE         NOT NULL,
        ytgrpno                             NUMBER(7)         NOT NULL       ,
  FOREIGN KEY (ytgrpno) REFERENCES ytgrp (ytgrpno)
);

COMMENT ON TABLE you is '카테고리';
COMMENT ON COLUMN you.youno is '카테고리 번호';
COMMENT ON COLUMN you.title is '카테고리 이름 ';
COMMENT ON COLUMN you.url is '주소창';
COMMENT ON COLUMN you.rdate is '등록일';
COMMENT ON COLUMN you.ytgrpno is '카테고리 그룹 번호';

DROP SEQUENCE you_seq;

CREATE SEQUENCE you_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  



-- 등록
INSERT INTO you(youno, title, url, rdate, ytgrpno)
VALUES(you_seq.nextval, '영화' ,'<iframe width="238" height="134" src="https://www.youtube.com/embed/jo0TyxkNkrY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
,  sysdate, 2);


         
COMMIT;


