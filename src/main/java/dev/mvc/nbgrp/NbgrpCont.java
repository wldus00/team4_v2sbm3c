package dev.mvc.nbgrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import dev.mvc.nbgrp.NbgrpVO;

@Controller
public class NbgrpCont {
    @Autowired
    @Qualifier("dev.mvc.nbgrp.NbgrpProc") // @Component("dev.mvc.nbgrp.NbgrpProc")
    private NbgrpProcInter nbgrpProc;
    
    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/nbgrp/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward, msg.jsp

        return mav; // forward
    }

    // http://localhost:9091/nbgrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/nbgrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/nbgrp/create"); // webapp/WEB-INF/views/nbgrp/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/nbgrp/create.do
    /**
     * 등록 처리
     * CategrpVO categrpVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨. 
     * <form> 태그에 존재하는 값들은 CategrpVO categrpVO 객체안의 필드에 setter를 이용하여 자동 할당됨.  
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/nbgrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(NbgrpVO nbgrpVO) { // nbgrpVO 자동 생성, Form -> VO
        // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("nbgrpVO", nbgrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.nbgrpProc.create(nbgrpVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);  // request.setAttribute("cnt", cnt); 
       
        if (cnt == 1) {
            mav.setViewName("redirect:/nbgrp/list.do");
        } else {
            // request에 저장, request.setAttribute("code", "create_fail")
            mav.addObject("code", "create_fail"); 
            mav.setViewName("/nbgrp/msg"); // /WEB-INF/views/nbgrp/msg.jsp
        }

        return mav; // forward
    }
    
    /**
     * 조회 + 수정폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
     * http://localhost:9091/nbgrp/read_ajax.do?nbgrpno=1
     * {"nbgrpno":1,rdate":"2021-04-08 17:01:28","name":"문화"}
     * @param nbgrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nbgrp/read_ajax.do", method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax(int nbgrpno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    

        NbgrpVO nbgrpVO = this.nbgrpProc.read(nbgrpno);
          
        JSONObject json = new JSONObject();
        json.put("nbgrpno", nbgrpVO.getNbgrpno());
        json.put("name", nbgrpVO.getName());
        json.put("rdate", nbgrpVO.getRdate());
          
        return json.toString();
    }

    /**
     * 조회 + 삭제폼 + 카테고리 그룹에 속한 카테고리 레코드 갯수 
     * http://localhost:9091/nbgrp/read_ajax2.do?nbgrpno=1
     * {"nbgrpno":1,rdate":"2022-04-28 15:19:39","name":"푸드 코트","count_by_nbgrpno":3}
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nbgrp/read_ajax2.do", method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax2(int nbgrpno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }    

        NbgrpVO nbgrpVO = this.nbgrpProc.read(nbgrpno);
          
        JSONObject json = new JSONObject();
        json.put("nbgrpno", nbgrpVO.getNbgrpno());
        json.put("name", nbgrpVO.getName());
        json.put("rdate", nbgrpVO.getRdate());
        
        // 카테고리 그룹에 속한 카테고리수 파악 nb 개발후
      //  int count_by_nbgrpno =  this.nbgrProc.count_by_categrpno(categrpno);
      //  json.put("count_by_categrpno", count_by_categrpno);
        
        return json.toString();
    }
    
    // http://localhost:9091/categrp/update.do
    /**
     * 수정 처리
     * 
     * @param nbgrpVO
     * @return
     */
    @RequestMapping(value = "/nbgrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(NbgrpVO nbgrpVO) {
        // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("nbgrpVO", nbgrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.nbgrpProc.update(nbgrpVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            // System.out.println("수정 성공");
            // response.sendRedirect("/nbgrp/list.do");
            mav.setViewName("redirect:/nbgrp/list.do");
        } else {
            mav.addObject("code", "update_fail"); // request에 저장, request.setAttribute("code", "update_fail")
            mav.setViewName("/nbgrp/msg"); // /WEB-INF/views/nbgrp/msg.jsp
        }

        return mav;
    }
 
    // http://localhost:9091/nbgrp/read_delete.do
    /**
     * 조회 + 삭제폼
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nbgrp/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int nbgrpno) {
      ModelAndView mav = new ModelAndView();
      
      NbgrpVO nbgrpVO = this.nbgrpProc.read(nbgrpno); // 삭제할 자료 읽기
      mav.addObject("nbgrpVO", nbgrpVO);  // request 객체에 저장
      
      List<NbgrpVO> list = this.nbgrpProc.list_nbgrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/nbgrp/read_delete"); // read_delete.jsp
      return mav;
    }
    
    // http://localhost:9091/nbgrp/delete.do
    /**
     * 삭제
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nbgrp/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int nbgrpno) {
      ModelAndView mav = new ModelAndView();
      
      NbgrpVO nbgrpVO = this.nbgrpProc.read(nbgrpno); // 삭제 정보
      mav.addObject("nbgrpVO", nbgrpVO);  // request 객체에 저장
      
      int cnt = this.nbgrpProc.delete(nbgrpno); // 삭제 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      // mav.setViewName("/categrp/delete_msg"); // delete_msg.jsp
      mav.setViewName("redirect:/nbgrp/list.do");

      return mav;
    }
    
    // http://localhost:9091/nbgrp/list.do
    /**
     * 목록
     * @return
     */
    @RequestMapping(value="/nbgrp/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();
      // 등록 순서별 출력    
      List<NbgrpVO> list = this.nbgrpProc.list_nbgrpno_asc();
      
      mav.addObject("list", list); // request.setAttribute("list", list);

//    mav.setViewName("/categrp/list"); // /webapp/WEB-INF/views/nbgrp/list.jsp
      mav.setViewName("/nbgrp/list_ajax"); // /webapp/WEB-INF/views/nbgrp/list_ajax.jsp
      return mav;
    }
    


}
