package dev.mvc.ytgrp;

import java.util.List;

public interface YtgrpProcInter {
	 /**
	   * 등록
	   * @param categrpVO
	   * @return 등록된 레코드 갯수
	   */
	  public int create(YtgrpVO ytgrpVO);
	  /**
	   * 등록 순서별 목록
	   * select id="list_urlgrpno_asc" resultType="dev.mvc.categrp.CategrpVO"
	   * @return
	   */
	  public List<YtgrpVO> list_ytgrpno_asc();
	  /**
	     * 수정 처리
	     * update id="update" parameterType="dev.mvc.urlgrp.urlgrpVO"
	     * @param urlgrpVO
	     * @return 처리된 레코드 갯수
	     */
	    public int update(YtgrpVO ytgrpVO);
	    /**
		   * 조회, 수정폼
		   * select id="read" resultType="dev.mvc.categrp.CategrpVO" parameterType="int"
		   * @param categrpno 카테고리 그룹 번호, PK
		   * @return
		   */
		    public YtgrpVO read(int ytgrpno);
		    /**
		     * 삭제 처리
		     * @param categrpno
		     * @return 처리된 레코드 갯수
		     */
		    public int delete(int ytgrpno);
}


