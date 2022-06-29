package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeProcInter {
    /**
     * 등록
     * @param contentsVO
     * @return
     */
    public int create(NoticeVO noticeVO);

    /** 
     * 조회
     * 
     * @param contentsno
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
     * @param contentsVO
     * @return 처리된 레코드 개수
     */
    public int update_text(NoticeVO noticeVO);
    
    /**
     * 파일 정보 수정
     * @param contentsVO
     * @return 처리된 레코드 개수
     */
    public int update_file(NoticeVO noticeVO);
    
    /**
     * 삭제
     * @param contentsno
     * @return
     */
    public int delete(int noticeno);
    
    /**
     * 글 수 증가
     * @param 
     * @return
     */ 
    public int increaseReplycnt(int noticeno);
   
    /**
     * 글 수 감소
     * @param 
     * @return
     */   
    public int decreaseReplycnt(int noticeno);
    
    /**
     * 조회수 증가
     * @param 
     * @return
     */  
    public int views(int noticeno);
    
}
