package dev.mvc.nbgrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.nbgrp.NbgrpDAOInter">에 선언
// 스프링이 자동으로 구현
// NbgrpDAOInter를 Spring이 구현함.
// DBMS 연결 해제 자동 구현
// JAVA + SQL 결합 코드 자동 구현
// getter, setter 자동 호출
// 개발자는 메소드의 입출력을 정의함.
public interface NbgrpDAOInter {
  /**
   * 등록
   * insert id="create" parameterType="dev.mvc.nbgrp.NbgrpVO"
   * @param categrpVO
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







