package dev.mvc.member;

import java.util.List;

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

}
