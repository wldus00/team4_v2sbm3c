package dev.mvc.ytgrp;

/*ytgrpno                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
title                          		VARCHAR2(200)		 NOT NULL,
cnt                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
visible                       		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
rdate                         		DATE		 NOT NULL*/
public class YtgrpVO {
	
		  private int ytgrpno;
		    /** 移댄뀒怨좊━ �씠由� */
		    private String title;
		    /** 異쒕젰 �닚�꽌 */
		    private int cnt;
		    /** 異쒕젰 紐⑤뱶 */
		    private String visible;
		    /** �벑濡앹씪 */
		    private String rdate;
		    
		    public  YtgrpVO() {
		    	
		    }

			public int getYtgrpno() {
				return ytgrpno;
			}

			public void setYtgrpno(int ytgrpno) {
				this.ytgrpno = ytgrpno;
			}

			public String getTitle() {
				return title;
			}

			public void setTitle(String title) {
				this.title = title;
			}

			public int getCnt() {
				return cnt;
			}

			public void setCnt(int cnt) {
				this.cnt = cnt;
			}

			public String getVisible() {
				return visible;
			}

			public void setVisible(String visible) {
				this.visible = visible;
			}

			public String getRdate() {
				return rdate;
			}

			public void setRdate(String rdate) {
				this.rdate = rdate;
			}
		    
}
