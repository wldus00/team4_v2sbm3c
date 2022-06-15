package dev.mvc.review;

import java.util.List;
import java.util.Map;

public interface ReviewProcInter {
    public int create(ReviewVO reviewVO);

    public List<ReviewVO> list();
      
    public List<ReviewMemberVO> list_join(int contentsno);
 
    public int checkPasswd(Map<String, Object> map);
      
    public int delete(int reviewno);
    
    public List<ReviewVO> list_memberno(int memberno);
    
    public ReviewVO read(int reviewno);

}