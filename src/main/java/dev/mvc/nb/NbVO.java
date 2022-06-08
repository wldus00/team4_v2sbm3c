package dev.mvc.nb;


public class NbVO {
  /** 카테고리 번호 */
  private int nbno;  
  /** 카테고리 그룹 번호 */
  private int nbgrpno;
  /** 카테고리 이름 */
  private String name;
  /** 등록일 */
  private String rdate;
  
  public NbVO() {
      
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
  
  
}