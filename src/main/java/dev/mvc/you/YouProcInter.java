package dev.mvc.you;

import java.util.List;

public interface YouProcInter {
	 /**
	   * 등록
	   * @param cateVO
	   * @return 등록된 갯수
	   */
	  public int create(YouVO youVO);
	  /**
	   *  전체 목록
	   * @return
	   */
	  public List<YouVO>list_all();  
	  /**
	   *  yougrpno별 목록
	   * @return
	   */
	  public List<YouVO> list_by_ytgrpno(int ytgrpno);  
	  /**
	   * 조회, 수정폼
	   * @param cateno 카테고리 번호, PK
	   * @return
	   */
	  public YouVO read(int youno);
	  
	  /**
	   * 수정 처리
	   * @param cateVO
	   * @return 수정된 레코드 갯수
	   */
	  public int update(YouVO youVO);
	  /**
	   * 삭제 처리 
	   * @param cateno
	   * @return 삭제된 레코드 갯수
	   */
	  public int delete(int youno);
	 
}
