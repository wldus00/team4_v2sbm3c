package dev.mvc.you;

public class YouVO {
	/*
     youno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
         title                                VARCHAR2(50)         NOT NULL,
        url                                  VARCHAR2(2000)         NOT NULL,
        rdate                                 DATE         NOT NULL,
        ytgrpno                             NUMBER(7)         NOT NULL       ,
	    FOREIGN KEY (ytgrpno) REFERENCES ytgrp (ytgrpno)
	); 
	 */

	  /** ī�װ� ��ȣ */
	  private int youno;  
	  /** ī�װ� �׷� ��ȣ */
	  private String title;
	  /** ī�װ� �̸� */
	  private String url;
	  /** ����� */
	  private String rdate;
	  /** ��ϵ� �� �� */
	  private int ytgrpno;
	  public YouVO(){
		  
	  }
	public int getYouno() {
		return youno;
	}
	public void setYouno(int youno) {
		this.youno = youno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getYtgrpno() {
		return ytgrpno;
	}
	public void setYtgrpno(int ytgrpno) {
		this.ytgrpno = ytgrpno;
	}
	
}
