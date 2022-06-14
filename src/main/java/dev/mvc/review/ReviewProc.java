package dev.mvc.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter {
  @Autowired
  private ReviewDAOInter reviewDAO; 
  
  @Override
  public int create(ReviewVO reviewVO) {
    int count = reviewDAO.create(reviewVO);
    return count;
  }
  
  @Override
  public List<ReviewVO> list() {
    List<ReviewVO> list = reviewDAO.list();
    return list;
  }

  @Override
  public List<ReviewMemberVO> list_join(int contentsno) {
      List<ReviewMemberVO> list = reviewDAO.list_join(contentsno);
      
      // 특수 문자 변경
      for (ReviewMemberVO reviewMemberVO:list) {
        String content = reviewMemberVO.getContent();
        
        content = Tool.convertChar(content);
        reviewMemberVO.setContent(content);
      }
      
      return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
      int count = reviewDAO.checkPasswd(map);
      return count;
  }

  @Override
  public int delete(int reviewno) {
      int count = reviewDAO.delete(reviewno);
      return count;
  }

}