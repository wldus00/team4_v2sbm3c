package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
      mav.addObject("msg", "회원가입 성공!");
      
      mav.setViewName("/member/msg");
      
      return mav;
    }
    
    /**
     * 로그인 폼
     * @return
     */
    // http://localhost:9091/member/login.do 
    @RequestMapping(value = "/member/login.do", 
                               method = RequestMethod.GET)
    public ModelAndView login_cookie(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      
      Cookie[] cookies = request.getCookies();
      Cookie cookie = null;
  
      String ck_id = ""; // id 저장
      String ck_id_save = ""; // id 저장 여부를 체크
      String ck_passwd = ""; // passwd 저장
      String ck_passwd_save = ""; // passwd 저장 여부를 체크
  
      if (cookies != null) {
        for (int i=0; i < cookies.length; i++){
          cookie = cookies[i]; // 쿠키 객체 추출
          
          if (cookie.getName().equals("ck_id")){
            ck_id = cookie.getValue(); 
          }else if(cookie.getName().equals("ck_id_save")){
            ck_id_save = cookie.getValue();  // Y, N
          }else if (cookie.getName().equals("ck_passwd")){
            ck_passwd = cookie.getValue();         // 1234
          }else if(cookie.getName().equals("ck_passwd_save")){
            ck_passwd_save = cookie.getValue();  // Y, N
          }
        }
      }
      
      mav.addObject("ck_id", ck_id); 
      mav.addObject("ck_id_save", ck_id_save);
      mav.addObject("ck_passwd", ck_passwd);
      mav.addObject("ck_passwd_save", ck_passwd_save);
      
      mav.setViewName("/member/login_ck_form");
      return mav;
    }
    
    /**
     * Cookie 기반 로그인 처리
     * @param request Cookie를 읽기위해 필요
     * @param response Cookie를 쓰기위해 필요
     * @param session 로그인 정보를 메모리에 기록
     * @param id  회원 아이디
     * @param passwd 회원 패스워드
     * @param id_save 회원 아이디 Cookie에 저장 여부
     * @param passwd_save 패스워드 Cookie에 저장 여부
     * @return
     */
    // http://localhost:9091/member/login.do 
    @RequestMapping(value = "/member/login.do", 
                               method = RequestMethod.POST)
    public ModelAndView login_cookie_proc(
                               HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session,
                               String id, String pw,
                               @RequestParam(value="id_save", defaultValue="") String id_save,
                               @RequestParam(value="passwd_save", defaultValue="") String passwd_save,
                               @RequestParam(value="return_url", defaultValue="") String return_url) {
      ModelAndView mav = new ModelAndView();
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("id", id);
      map.put("pw", pw);
      
      int count = memberProc.login(map);
      if (count == 1) { // 로그인 성공
        // System.out.println(id + " 로그인 성공");
        MemberVO memberVO = memberProc.member_readById(id);
        session.setAttribute("memberno", memberVO.getMemberno()); // 서버의 메모리에 기록
        session.setAttribute("id", id);
        session.setAttribute("username", memberVO.getUsername());
        session.setAttribute("grade", memberVO.getGrade());
        
        // -------------------------------------------------------------------
        // id 관련 쿠기 저장
        // -------------------------------------------------------------------
        if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
          Cookie ck_id = new Cookie("ck_id", id);
          ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
          ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
          response.addCookie(ck_id); // id 저장
        } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
          Cookie ck_id = new Cookie("ck_id", "");
          ck_id.setPath("/");
          ck_id.setMaxAge(0);
          response.addCookie(ck_id); // id 저장
        }
        // id를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_id_save = new Cookie("ck_id_save", id_save);
        ck_id_save.setPath("/");
        ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_id_save);
        // -------------------------------------------------------------------

        // -------------------------------------------------------------------
        // Password 관련 쿠기 저장
        // -------------------------------------------------------------------
        if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
          Cookie ck_passwd = new Cookie("ck_passwd", pw);
          ck_passwd.setPath("/");
          ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
          response.addCookie(ck_passwd);
        } else { // N, 패스워드를 저장하지 않을 경우
          Cookie ck_passwd = new Cookie("ck_passwd", "");
          ck_passwd.setPath("/");
          ck_passwd.setMaxAge(0);
          response.addCookie(ck_passwd);
        }
        // passwd를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
        ck_passwd_save.setPath("/");
        ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd_save);
        // -------------------------------------------------------------------
        
        System.out.println("-> return_url: " + return_url);
        
        if (return_url.length() > 0) { // ★
          mav.setViewName("redirect:" + return_url);  
        } else {
          mav.setViewName("redirect:/index.do");
        }
      } else {
        mav.addObject("url", "login_fail_msg");
        mav.setViewName("redirect:/member/msg.do"); 
      }
          
      
      
      return mav;
    }    
    
    /**
     * 로그아웃 처리
     * @param session
     * @return
     */
    @RequestMapping(value="/member/logout.do", 
                               method=RequestMethod.GET)
    public ModelAndView logout(HttpSession session){
      ModelAndView mav = new ModelAndView();
      session.invalidate(); // 모든 session 변수 삭제
      mav.addObject("msg", "로그아웃 성공");
      
      mav.setViewName("/member/msg"); // 새로고침 방지
      
      return mav;
    }
    
    
    @RequestMapping(value="/member/mypage.do", method=RequestMethod.GET)
    public ModelAndView mypage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/member/mypage");

        return mav;
    }
    
    @RequestMapping(value="/member/member_update.do", method=RequestMethod.GET)
    public ModelAndView member_read(int memberno) {
      ModelAndView mav = new ModelAndView();
        MemberVO memberVO = this.memberProc.member_read(memberno);
        
        mav.addObject("memberVO", memberVO);
        mav.setViewName("/member/member_update"); // /webapp/WEB-INF/views/member/list.jsp
      return mav;
    }
    
    @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
    public ModelAndView member_update(MemberVO memberVO) {
      ModelAndView mav = new ModelAndView();
        int cnt = this.memberProc.member_update(memberVO);
        
        mav.addObject("cnt", cnt);
        mav.addObject("msg","회원 정보 수정 성공");
        mav.setViewName("/member/msg"); // /webapp/WEB-INF/views/member/list.jsp
        System.out.println("성공!");
        System.out.println("cnt : "+ cnt);
      return mav;
    }  

    
    /**
     * 목록 + 검색 + 페이징 지원
     * http://localhost:9090/contents/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
     * 
     * @param cateno
     * @param word
     * @param now_page
     * @return
     */
    @RequestMapping(value = "/member/list.do", method = RequestMethod.GET)
    public ModelAndView member_list_paging(
            @RequestParam(value = "now_page", defaultValue = "1") int now_page,
            @RequestParam(value = "cate", defaultValue = "") String cate,
            @RequestParam(value = "search", defaultValue = "") String search
            ) {
      System.out.println("--> now_page: " + now_page);

      ModelAndView mav = new ModelAndView();

      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

      // 검색 목록
      List<MemberVO> list = memberProc.member_list_paging(map);
      mav.addObject("list", list);

      // 검색된 레코드 갯수
      int search_count = memberProc.search_count(map);
      mav.addObject("search_count", search_count);

      String paging = memberProc.pagingBox(cate, search_count, now_page, search);
      mav.addObject("paging", paging);

      // mav.addObject("now_page", now_page);

      // /contents/list_by_cateno_table_img1_search_paging.jsp
      mav.setViewName("/member/member_list_paging");
      
      return mav;
    }
    
    @RequestMapping(value = "/member/member_list_search_paging.do", method = RequestMethod.GET)
    public ModelAndView member_list_search_paging(
            @RequestParam(value = "cate", defaultValue = "") String cate,
            @RequestParam(value = "now_page", defaultValue = "1") int now_page,
            @RequestParam(value = "word", defaultValue = "") String word) {
      ModelAndView mav = new ModelAndView();
      
      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cate", cate);
      map.put("word", word);
      map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

      // 검색 목록
      List<MemberVO> list = memberProc.member_list_search_paging(map);
      mav.addObject("list", list);
      
      // 검색된 레코드 갯수
      int search_count = memberProc.search_count(map);
      mav.addObject("search_count", search_count);
      System.out.println("검색 갯수 : " + search_count);
      String paging = memberProc.pagingBox(cate, search_count, now_page, word);
      mav.addObject("paging", paging);
      mav.addObject("now_page", now_page);

      System.out.println("member_list_search_paging 기능 발동");
      mav.setViewName("/member/member_list_paging");
      return mav;
    }
    
    /**
     * Ajax 기반 회원 조회
     * http://localhost:9091/member/read_ajax.do
     * @param memberno
     * @return
     */
    @RequestMapping(value="/member/read_ajax.do", method=RequestMethod.GET)
    @ResponseBody
    public String read_ajax(HttpSession session){
        int memberno = Integer.parseInt(String.valueOf(session.getAttribute("memberno")));
      
      MemberVO memberVO = this.memberProc.member_read(memberno);
      
      JSONObject json = new JSONObject();
      json.put("rname", memberVO.getUsername());
      json.put("rtel", memberVO.getTel());
      json.put("rzipcode", memberVO.getZipcode());
      json.put("raddress1", memberVO.getAddress1());
      json.put("raddress2", memberVO.getAddress2());
      
      return json.toString();
    }
    
    @RequestMapping(value = "/member/member_pwupdate.do", method = RequestMethod.GET)
    public ModelAndView pwupdate() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/member_pwupdate");

        return mav;
    }
    
    @RequestMapping(value="/member/member_pwupdate.do", method=RequestMethod.POST)
    public ModelAndView member_pwupdate(MemberVO memberVO) {
      ModelAndView mav = new ModelAndView();
      
        int cnt = this.memberProc.member_pwupdate(memberVO);
        mav.addObject("cnt", cnt);
        if (cnt == 1) {
        mav.addObject("msg","비밀번호 변경 성공");
        mav.setViewName("/member/msg"); // /webapp/WEB-INF/views/member/list.jsp
        System.out.println("성공!");
        System.out.println("cnt : "+ cnt);
        } else {
            mav.addObject("msg","비밀번호 변경 실패");
            mav.setViewName("/member/msg_fail"); // /webapp/WEB-INF/views/member/list.jsp
        }
      return mav;
    }  
}
