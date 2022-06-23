package dev.mvc.ytgrp;

import java.util.List;



public interface YtgrpDAOInter {
	 /**
	   * ���
	   * @param categrpVO
	   * @return ��ϵ� ���ڵ� ����
	   */
	  public int create(YtgrpVO ytgrpVO);
	  /**
	   * ��� ������ ���
	   * select id="list_urlgrpno_asc" resultType="dev.mvc.categrp.CategrpVO"
	   * @return
	   */
	  public List<YtgrpVO> list_ytgrpno_asc();
	  /**
	     * ���� ó��
	     * update id="update" parameterType="dev.mvc.urlgrp.urlgrpVO"
	     * @param urlgrpVO
	     * @return ó���� ���ڵ� ����
	     */
	    public int update(YtgrpVO ytgrpVO);
	  /**
	   * ��ȸ, ������
	   * select id="read" resultType="dev.mvc.categrp.CategrpVO" parameterType="int"
	   * @param categrpno ī�װ� �׷� ��ȣ, PK
	   * @return
	   */
	    public YtgrpVO read(int ytgrpno);
	    /**
	     * ���� ó��
	     * @param categrpno
	     * @return ó���� ���ڵ� ����
	     */
	    public int delete(int ytgrpno);
	  
	   
	    
}
