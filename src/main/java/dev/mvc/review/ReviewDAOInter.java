package dev.mvc.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.contents.ContentsVO;

public interface ReviewDAOInter {
    public int create(ReviewVO reviewVO);

    public List<ReviewVO> list();
      
    public List<ReviewMemberVO> list_join(int contentsno);
    
    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<ReviewMemberVO> list_paging(HashMap<String, Object> map);
    
    public int search_count(HashMap<String, Object> hashMap);
 
    public int checkPasswd(Map<String, Object> map);
      
    public int delete(int reviewno);
     
    public List<ReviewVO> list_memberno(int memberno);
    
    public ReviewVO read(int reviewno);
}