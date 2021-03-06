package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberProcInter {

    public int member_create(MemberVO memberVO);

    public MemberVO member_search(int memberno);
    
    public int member_idcheck(String id);
    
    public List<MemberVO> member_list();

    public int member_search_pw_update(HashMap<Object, Object> map);
    
    public int member_update(MemberVO memberVO);
    
    public int login(Map<String, Object> map);
    
    public MemberVO member_read(int memberno);
    
    public MemberVO member_readById(String id);
    
    public int delete(int memberno);
    
    public int passwd_check(HashMap<Object, Object> map);
    
    public List<MemberVO> member_list_paging(HashMap<String, Object> map);
    
    public List<MemberVO> member_list_search_paging(HashMap<String, Object> Map);
    
    public int search_count(HashMap<String, Object> hashMap);
    /**
     * 
     * @param cate 
     * @param search_count
     * @param now_page
     * @param search
     * @return
     */
    public String pagingBox(String cate, int search_count, int now_page, String word);
    
    public int member_pwupdate(MemberVO memberVO);
}
