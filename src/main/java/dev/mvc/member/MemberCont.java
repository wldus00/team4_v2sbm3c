package dev.mvc.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCont {
    @Autowired
    @Qualifier("dev.mvc.member.MemberProc")
    private MemberProcInter memberProc = null;

    public MemberCont() {
        System.out.println("-> MemberCont created.");
    }

    @ResponseBody
    @RequestMapping(value = "/member/checkID.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String checkID(String id) {
        int cnt = this.memberProc.member_idcheck(id);

        JSONObject json = new JSONObject();
        json.put("cnt", cnt);

        return json.toString();
    }

    @RequestMapping(value = "/member/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/member/create");

        return mav;
    }
    
    @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
    public ModelAndView create(MemberVO memberVO){
      ModelAndView mav = new ModelAndView();
      
       System.out.println("id: " + memberVO.getId());
      
      int cnt= memberProc.member_create(memberVO);
      if (cnt == 1) {
        System.out.println("가입 성공!");
    } else {
        System.out.println("가입 실패...");
    }
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
      
      mav.setViewName("redirect:/");
      
      return mav;
    }
    
    @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();
      
      //if (this.memberProc.isAdmin(session)) {
        List<MemberVO> list = memberProc.member_list();
        
        mav.addObject("list", list);

        mav.setViewName("/member/list"); // /webapp/WEB-INF/views/member/list.jsp
       
      return mav;
    }  

}
