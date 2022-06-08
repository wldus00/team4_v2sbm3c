package dev.mvc.nbgrp;

import java.util.List;

public interface NbgrpProcInter {
    /**
     * 등록
     * insert id="create" parameterType="dev.mvc.nbgrp.NbgrpVO"
     * @param nbgrpVO
     * @return 등록된 레코드 갯수
     */
    public int create(NbgrpVO nbgrpVO);
   
    /**
     * 등록 순서별 목록
     * select id="list_nbgrpno_asc" resultType="dev.mvc.nbgrp.NbgrpVO"
     * @return
     */
    public List<NbgrpVO> list_nbgrpno_asc();
    
    /**
     * 조회, 수정폼
     * select id="read" resultType="dev.mvc.nbgrp.NbgrpVO" parameterType="int"
     * @param nbgrpno 카테고리 그룹 번호, PK
     * @return
     */
    public NbgrpVO read(int nbgrpno);
    
    /**
     * 수정 처리
     * update id="update" parameterType="dev.mvc.nbgrp.NbgrpVO"
     * @param nbgrpVO
     * @return 처리된 레코드 갯수
     */
    public int update(NbgrpVO nbgrpVO);

    /**
     * 삭제 처리
     * delete id="delete" parameterType="int"
     * @param nbgrpno
     * @return 처리된 레코드 갯수
     */
    public int delete(int nbgrpno);
 


    
}






