package dev.mvc.nbgrp;

/*
    categrpno                         NUMBER(7)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                                 DATE     NOT NULL 
 */
public class NbgrpVO {
    /** 카테고리 그룹 번호 */
    private int nbgrpno;
    /** 카테고리 이름 */
    private String name;
    /** 등록일 */
    private String rdate;
    
    public NbgrpVO() {
        
    }

    public int getNbgrpno() {
        return nbgrpno;
    }

    public void setNbgrpno(int nbgrpno) {
        this.nbgrpno = nbgrpno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }
    
    

    
}


