package dev.mvc.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.contents.ContentsVO;
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
  public List<ReviewMemberVO> list_paging(HashMap<String, Object> map) {
      int begin_of_page = ((Integer)map.get("now_page") - 1) * Review.RECORD_PER_PAGE;
      int start_num = begin_of_page + 1;
      int end_num = begin_of_page + Review.RECORD_PER_PAGE;   

      map.put("start_num", start_num);
      map.put("end_num", end_num);
     
      List<ReviewMemberVO> list = this.reviewDAO.list_paging(map);
      
      for (ReviewMemberVO reviewMemberVO:list) {
          String content = reviewMemberVO.getContent();
          
          content = Tool.convertChar(content);
          reviewMemberVO.setContent(content);
        }
      
      return list;
  }

  @Override
  public String pagingBox(int contentsno, int search_count, int now_page, String content) {
      int total_page = (int)(Math.ceil((double)search_count/Review.RECORD_PER_PAGE)); // 전체 페이지 수 
      int total_grp = (int)(Math.ceil((double)total_page/Review.PAGE_PER_BLOCK)); // 전체 그룹  수
      int now_grp = (int)(Math.ceil((double)now_page/Review.PAGE_PER_BLOCK));  // 현재 그룹 번호
      int start_page = ((now_grp - 1) * Review.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
      int end_page = (now_grp * Review.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
       
      StringBuffer str = new StringBuffer(); 
       
      str.append("<style type='text/css'>"); 
      str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
      str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
      str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
      str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
      str.append("  .span_box_1{"); 
      str.append("    text-align: center;");    
      str.append("    font-size: 1em;"); 
      str.append("    border: 1px;"); 
      str.append("    border-style: solid;"); 
      str.append("    border-color: #cccccc;"); 
      str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("  }"); 
      str.append("  .span_box_2{"); 
      str.append("    text-align: center;");    
      str.append("    background-color: #668db4;"); 
      str.append("    color: #FFFFFF;"); 
      str.append("    font-size: 1em;"); 
      str.append("    border: 1px;"); 
      str.append("    border-style: solid;"); 
      str.append("    border-color: #cccccc;"); 
      str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
      str.append("  }"); 
      str.append("</style>"); 
      str.append("<DIV id='paging'>"); 

      int _now_page = (now_grp - 1) * Review.PAGE_PER_BLOCK;  
      if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
        str.append("<span class='span_box_1'><A href='"+Review.LIST_FILE+"?&content="+content+"&now_page="+_now_page+"&contentsno="+contentsno+"'>이전</A></span>"); 
      } 
   
      // 중앙의 페이지 목록
      for(int i=start_page; i<=end_page; i++){ 
        if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
          break; 
        } 
    
        if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
          str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
        }else{
          // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
          str.append("<span class='span_box_1'><A href='"+Review.LIST_FILE+"?content="+content+"&now_page="+i+"&contentsno="+contentsno+"'>"+i+"</A></span>");   
        } 
      } 
   
      _now_page = (now_grp * Review.PAGE_PER_BLOCK)+1; //  최대 페이지수 + 1 
      if (now_grp < total_grp){ 
        str.append("<span class='span_box_1'><A href='"+Review.LIST_FILE+"?&content="+content+"&now_page="+_now_page+"&contentsno="+contentsno+"'>다음</A></span>"); 
      } 
      str.append("</DIV>"); 
       
      return str.toString(); 
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

  @Override
  public List<ReviewVO> list_memberno(int memberno) {
      List<ReviewVO> list = this.reviewDAO.list_memberno(memberno);
      return list;
  }
  
  @Override
  public ReviewVO read(int reviewno) {
      ReviewVO reviewVO = this.reviewDAO.read(reviewno);

      String content = reviewVO.getContent();
      content = Tool.convertChar(content);
      reviewVO.setContent(content);

      long size1 = reviewVO.getSize1();
      reviewVO.setSize1_label(Tool.unit(size1));

      return reviewVO;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
      int count = reviewDAO.search_count(hashMap);
      return count;
  }

}