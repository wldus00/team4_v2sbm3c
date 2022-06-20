package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter{
    
    @Autowired
    private MemberDAOInter memberDAO;
    
    public MemberProc() {
        System.out.println("-> MemberProc created.");

    }

    @Override
    public int member_idcheck(String id) {
        int cnt = this.memberDAO.member_idcheck(id);
        return cnt;
    }
    
    @Override
    public int member_create(MemberVO memberVO) {
        int cnt = this.memberDAO.member_create(memberVO);
        return cnt;
    }

    @Override
    public List<MemberVO> member_list() {
        List<MemberVO> list = this.memberDAO.member_list();
        return list;
    }

    @Override
    public MemberVO member_search(int memberno) {
        MemberVO memberVO = this.memberDAO.member_search(memberno);
        return memberVO;
    }

    @Override
    public int member_search_pw_update(HashMap<Object, Object> map) {
        int cnt = this.memberDAO.member_search_pw_update(map);
        return cnt;
    }

    @Override
    public int member_update(MemberVO memberVO) {
        int cnt = this.memberDAO.member_update(memberVO);
        return cnt;
    }

    @Override
    public int login(Map<String, Object> map) {
        int cnt = this.memberDAO.login(map);
        return cnt;
    }

    @Override
    public MemberVO member_read(int memberno) {
        MemberVO memberVO = this.memberDAO.member_read(memberno);
        return memberVO;
    }

    @Override
    public MemberVO member_readById(String id) {
        MemberVO memberVO = this.memberDAO.member_readById(id);
        return memberVO;
    }

    @Override
    public int delete(int memberno) {
        int cnt = this.memberDAO.delete(memberno);
        return cnt;
    }

    @Override
    public int passwd_check(HashMap<Object, Object> map) {
        int cnt = this.memberDAO.passwd_check(map);
        return cnt;
    }

    @Override
    public List<MemberVO> member_list_paging(HashMap<String, Object> map) {
        int begin_of_page = ((Integer)map.get("now_page") - 1) * Member.RECORD_PER_PAGE;
       
        int start_num = begin_of_page + 1;
        
        int end_num = begin_of_page + Member.RECORD_PER_PAGE;   

        map.put("start_num", start_num);
        map.put("end_num", end_num);
       
        List<MemberVO> list = this.memberDAO.member_list_paging(map);
        
        return list;
    }

    @Override
    public String pagingBox(String cate, int search_count, int now_page, String word) {
        int total_page = (int)(Math.ceil((double)search_count/Member.RECORD_PER_PAGE)); // 전체 페이지 수 
        int total_grp = (int)(Math.ceil((double)total_page/Member.PAGE_PER_BLOCK)); // 전체 그룹  수
        int now_grp = (int)(Math.ceil((double)now_page/Member.PAGE_PER_BLOCK));  // 현재 그룹 번호
        
        // 1 group: 1, 2, 3 ... 9, 10
        // 2 group: 11, 12 ... 19, 20
        // 3 group: 21, 22 ... 29, 30
        int start_page = ((now_grp - 1) * Member.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
        int end_page = (now_grp * Member.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
         
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
        str.append("    background-color: #133969;"); 
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
//        str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
     
        // 이전 10개 페이지로 이동
        // now_grp: 1 (1 ~ 10 page)
        // now_grp: 2 (11 ~ 20 page)
        // now_grp: 3 (21 ~ 30 page) 
        // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
        // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
        int _now_page = (now_grp - 1) * Member.PAGE_PER_BLOCK;  
        if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 페이지수가 11페이 이상임으로 이전 그룹으로 갈수 있는 링크 생성 
          str.append("<span class='span_box_1'><A href='"+Member.LIST_FILE+"?&cate="+cate+"&now_page="+_now_page+"&word="+word+"'>이전</A></span>");
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
            str.append("<span class='span_box_1'><A href='"+Member.LIST_FILE+"?&cate="+cate+"&now_page="+i+"&word="+word+"'>"+i+"</A></span>");   
          } 
        } 
     
        // 10개 다음 페이지로 이동
        // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
        // 현재 페이지 5일경우 -> 현재 1그룹: (1 * 10) + 1 = 2그룹의 시작페이지 11
        // 현재 페이지 15일경우 -> 현재 2그룹: (2 * 10) + 1 = 3그룹의 시작페이지 21
        // 현재 페이지 25일경우 -> 현재 3그룹: (3 * 10) + 1 = 4그룹의 시작페이지 31
        _now_page = (now_grp * Member.PAGE_PER_BLOCK)+1; //  최대 페이지수 + 1 
        if (now_grp < total_grp){ 
          str.append("<span class='span_box_1'><A href='"+Member.LIST_FILE+"?&cate="+cate+"&now_page="+_now_page+"&word="+word+"'>다음</A></span>"); 
        } 
        str.append("</DIV>"); 
         
        return str.toString(); 
    }

    @Override
    public int search_count(HashMap<String, Object> hashMap) {
        int cnt = memberDAO.search_count(hashMap);
        return cnt;
    }

    @Override
    public List<MemberVO> member_list_search_paging(HashMap<String, Object> map) {

        int begin_of_page = ((Integer)map.get("now_page") - 1) * Member.RECORD_PER_PAGE;
       
        int start_num = begin_of_page + 1;
        
        int end_num = begin_of_page + Member.RECORD_PER_PAGE;   

        map.put("start_num", start_num);
        
        map.put("end_num", end_num);
       
        List<MemberVO> list = this.memberDAO.member_list_search_paging(map);
        
        return list;
    }

}
