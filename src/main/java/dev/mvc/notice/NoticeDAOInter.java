package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;



public interface NoticeDAOInter {
    /**
     * 등록
     * @param 
     * @return
     */
    public int create(NoticeVO noticeVO);
    
    /** 
     * 조회
     * 
     * @param 
     * @return
     */
    public NoticeVO read(int noticeno);
    
    /**
     * 패스워드 검사
     * @param map
     * @return 1 or 0
     */
    public int passwd_check(HashMap<String, Object> map);
    
    
    /**
     * 특정 카테고리의 등록된 글목록
     * @return
     */
    public List<NoticeVO> list_by_notice();
    
    /**
     * 텍스트 정보 수정
     * @param 
     * @return 처리된 레코드 개수
     */
    public int update_text(NoticeVO noticeVO);
    
    /**
     * 파일 정보 수정
     * @param 
     * @return 처리된 레코드 개수
     */
    public int update_file(NoticeVO noticeVO);
    
    /**
     * 삭제
     * @param 
     * @return
     */
    public int delete(int noticeno);
}
