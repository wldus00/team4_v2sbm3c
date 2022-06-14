/**********************************/
/* Table Name: ��Ʈ�� */
/**********************************/
CREATE TABLE nbgrp(
		nbgrpno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE nbgrp is '��Ʈ��';
COMMENT ON COLUMN nbgrp.nbgrpno is '��Ʈ�� �׷� ��ȣ';
COMMENT ON COLUMN nbgrp.name is '�̸�';
COMMENT ON COLUMN nbgrp.rdate is '�׷� ������';

CREATE SEQUENCE nbgrp_seq
  START WITH 1               -- ���� ��ȣ
  INCREMENT BY 1           -- ������
  MAXVALUE 9999999999  -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


/* ��� */
INSERT INTO nbgrp(nbgrpno, name, rdate)
VALUES(nbgrp_seq.nextval, '��Ʈ��', sysdate);

/* ��� */
SELECT nbgrpno, name, rdate
FROM nbgrp
ORDER BY nbgrpno ASC;

/* ��ȸ */
SELECT nbgrpno, name, rdate 
FROM nbgrp
WHERE nbgrpno = 1;

/* ���� */
UPDATE nbgrp
SET name='����ũž'
WHERE nbgrpno = 1;

/* ���� */
DELETE FROM nbgrp
WHERE nbgrpno = 1;


/**********************************/
/* Table Name: ��Ʈ�� ���� */
/**********************************/
CREATE TABLE nbtype(
		nbno                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		nbgrpno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(50)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
  FOREIGN KEY (nbgrpno) REFERENCES nbgrp (nbgrpno)
);

COMMENT ON TABLE nbtype is '��Ʈ�� ����';
COMMENT ON COLUMN nbtype.nbno is '��Ʈ�� ��ȣ';
COMMENT ON COLUMN nbtype.nbgrpno is '��Ʈ�� �׷� ��ȣ';
COMMENT ON COLUMN nbtype.name is '��ɺ��̸�';
COMMENT ON COLUMN nbtype.rdate is '�����';

CREATE SEQUENCE nbtype_seq
  START WITH 1               -- ���� ��ȣ
  INCREMENT BY 1           -- ������
  MAXVALUE 9999999999  -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

INSERT INTO nbtype(nbno, nbgrpno, name, rdate)
VALUES(nbtype_seq.nextval, 3, '게임용', sysdate);

/**********************************/
/* Table Name: ������ - �ƺ� ��ǰ */
/**********************************/
drop table CONTENTS;
CREATE TABLE CONTENTS(
      CONTENTSNO                          NUMBER(10)       NOT NULL       PRIMARY KEY,
      nbno                                NUMBER(10)       NOT NULL,
      TITLE                               VARCHAR2(300)       NOT NULL,
      CONTENT                             CLOB  NOT NULL,
      RECOM                               NUMBER(7)       DEFAULT 0     NOT NULL,
      CNT                                 NUMBER(7)      DEFAULT 0     NOT NULL,
      PASSWD                              VARCHAR2(15)       NOT NULL,
      WORD                                VARCHAR2(300)       NULL ,
      RDATE                               DATE       NOT NULL,
      FILE1                               VARCHAR2(100)       NULL ,
      FILE1SAVED                          VARCHAR2(100)       NULL ,
      THUMB1                              VARCHAR2(100)       NULL ,
      SIZE1                               NUMBER(10)       NULL ,
      PRICE                               NUMBER(10)       NULL ,
      DC                                  NUMBER(10)       NULL ,
      SALEPRICE                           NUMBER(10)       NULL ,
      POINT                               NUMBER(10)       NULL ,
      SALECNT                             NUMBER(10)       NULL ,
  FOREIGN KEY (nbno) REFERENCES nbtype (nbno)
);

COMMENT ON TABLE CONTENTS is '������ - �ƺ� ��ǰ';
COMMENT ON COLUMN CONTENTS.CONTENTSNO is '������ ��ȣ';
COMMENT ON COLUMN CONTENTS.nbno is '��Ʈ�� ��ȣ';
COMMENT ON COLUMN CONTENTS.TITLE is '��ǰ��';
COMMENT ON COLUMN CONTENTS.CONTENT is '����';
COMMENT ON COLUMN CONTENTS.RECOM is '��õ��';
COMMENT ON COLUMN CONTENTS.CNT is '��ȸ��';
COMMENT ON COLUMN CONTENTS.PASSWD is '�н�����';
COMMENT ON COLUMN CONTENTS.WORD is '�˻���';
COMMENT ON COLUMN CONTENTS.RDATE is '�����';
COMMENT ON COLUMN CONTENTS.FILE1 is '���� �̹���';
COMMENT ON COLUMN CONTENTS.FILE1SAVED is '���� ����� ���� �̹���';
COMMENT ON COLUMN CONTENTS.THUMB1 is '���� �̹��� Preview';
COMMENT ON COLUMN CONTENTS.SIZE1 is '���� �̹��� ũ��';
COMMENT ON COLUMN CONTENTS.PRICE is '����';
COMMENT ON COLUMN CONTENTS.DC is '���η�';
COMMENT ON COLUMN CONTENTS.SALEPRICE is '�ǸŰ�';
COMMENT ON COLUMN CONTENTS.POINT is '����Ʈ';
COMMENT ON COLUMN CONTENTS.SALECNT is '����';

drop SEQUENCE contents_seq
CREATE SEQUENCE contents_seq
  START WITH 1               -- ���� ��ȣ
  INCREMENT BY 1           -- ������
  MAXVALUE 9999999999  -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����



