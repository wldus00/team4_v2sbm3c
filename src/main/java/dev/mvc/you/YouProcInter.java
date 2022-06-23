package dev.mvc.you;

import java.util.List;

public interface YouProcInter {
	 /**
	   * ���
	   * @param cateVO
	   * @return ��ϵ� ����
	   */
	  public int create(YouVO youVO);
	  /**
	   *  ��ü ���
	   * @return
	   */
	  public List<YouVO>list_all();  
	  /**
	   *  yougrpno�� ���
	   * @return
	   */
	  public List<YouVO> list_by_ytgrpno(int ytgrpno);  
	  /**
	   * ��ȸ, ������
	   * @param cateno ī�װ� ��ȣ, PK
	   * @return
	   */
	  public YouVO read(int youno);
	  
	  /**
	   * ���� ó��
	   * @param cateVO
	   * @return ������ ���ڵ� ����
	   */
	  public int update(YouVO youVO);
	  /**
	   * ���� ó�� 
	   * @param cateno
	   * @return ������ ���ڵ� ����
	   */
	  public int delete(int youno);
	 
}
