package dev.mvc.nb;

import java.util.List;

import dev.mvc.nb.NbVO;
import dev.mvc.nb.Nbgrp_NbVO;

public interface NbDAOInter {
    public int create(NbVO nbVO);
    
    /**
     *  전체 목록
     * @return
     */
    public List<NbVO> list_all();  
    
    /**
     *  nbgrpno별 목록
     * @return
     */
    public List<NbVO> list_by_nbgrpno(int nbgrpno);  
    
    /**
     * nbgrp + nb join, 연결 목록
     * @return
     */
    public List<Nbgrp_NbVO> list_all_join(); 
    
    /**
     * 조회, 수정폼
     * @param nbno 카테고리 번호, PK
     * @return
     */
    public NbVO read(int nbno);
    
    /**
     * 수정 처리
     * @param nbVO
     * @return
     */
    public int update(NbVO nbVO);
    
    /**
     * 삭제 처리 
     * @param nbno
     * @return
     */
    public int delete(int nbno);
    
    /**
     * 특정 그룹에 속한 레코드 갯수 산출
     * @param nbgrpno
     * @return
     */
    public int count_by_nbgrpno(int nbgrpno);
  
}