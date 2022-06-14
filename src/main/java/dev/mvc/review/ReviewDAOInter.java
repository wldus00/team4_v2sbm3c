package dev.mvc.review;

import java.util.List;
import java.util.Map;

public interface ReviewDAOInter {
    public int create(ReviewVO reviewVO);

    public List<ReviewVO> list();
      
    public List<ReviewMemberVO> list_join(int contentsno);
 
    public int checkPasswd(Map<String, Object> map);
      
    public int delete(int reviewno);
     
     
}