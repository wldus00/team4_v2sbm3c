package dev.mvc.member;

import java.util.List;

public interface MemberProcInter {

    public int member_idcheck(String id);

    public int member_create(MemberVO memberVO);
    
    public List<MemberVO> member_list();
    
}