package dev.mvc.nb;

public class Nbgrp_NbVO {
  /** 카테고리 그룹 번호 */
  private int r_nbgrpno;
  /**  카테고리 이름 */
  private String r_name;
  
  /** 카테고리 번호 */
  private int nbno;  
  /** 카테고리 그룹 번호 */
  private int nbgrpno;
  /** 카테고리 이름 */
  private String name;
  /** 등록일 */
  private String rdate;

  
  public Nbgrp_NbVO() {
      
  }
  
 
  
  public int getR_nbgrpno() {
      return r_nbgrpno;
  }

  public void setR_nbgrpno(int r_nbgrpno) {
      this.r_nbgrpno = r_nbgrpno;
  }

  public String getR_name() {
      return r_name;
  }

  public void setR_name(String r_name) {
      this.r_name = r_name;
  }

  public int getNbno() {
      return nbno;
  }

  public void setNbno(int nbno) {
      this.nbno = nbno;
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


@Override
  public String toString() {
    return "[r_nbgrpno=" + r_nbgrpno + ", r_name=" + r_name + ", nbno=" + nbno + ", nbgrpno="
        + nbgrpno + ", name=" + name + ", rdate=" + rdate + "]";
  }
    
}