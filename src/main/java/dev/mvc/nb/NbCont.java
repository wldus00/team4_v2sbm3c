package dev.mvc.nb;



import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.nb.Nbgrp_NbVO;
import dev.mvc.nbgrp.NbgrpProcInter;
import dev.mvc.nbgrp.NbgrpVO;
//import dev.mvc.contents.ContentsProcInter;

@Controller
public class NbCont {
    @Autowired
    @Qualifier("dev.mvc.nbgrp.NbgrpProc")
    private NbgrpProcInter nbgrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.nb.NbProc")
    private NbProcInter nbProc;
    
    /*
     * @Autowired
     * 
     * @Qualifier("dev.mvc.contents.ContentsProc") private ContentsProcInter
     * contentsProc;
     */
    public NbCont() {
        System.out.println("-> nbCont created.");
    }
    
    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/nb/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward

        return mav; // forward
    }
    
    /**
     * 등록폼 http://localhost:9091/nb/create.do?nbgrpno=2
     * 
     * @return
     */
    @RequestMapping(value = "/nb/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/nb/create"); // /webapp/WEB-INF/views/nb/create.jsp

      return mav;
    }
    
    /**
     * 등록처리
     */
    @RequestMapping(value = "/nb/create.do", method = RequestMethod.POST)
    public ModelAndView create(NbVO nbVO) {
      ModelAndView mav = new ModelAndView();

      // System.out.println("-> nbgrpno: " + nbVO.getnbgrpno());
      
      int cnt = this.nbProc.create(nbVO);
      // System.out.println("등록 성공");

      // request.setAttribute("code", "create_success");
      mav.addObject("code", "create_success");
      mav.addObject("cnt", cnt);
      mav.addObject("nbgrpno", nbVO.getNbgrpno());
      mav.addObject("name", nbVO.getName());
      
      // mav.setViewName("/nb/msg");
      
      mav.addObject("url", "/nb/msg");  // /nb/msg -> /nb/msg.jsp
      mav.setViewName("redirect:/nb/msg.do");
      
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9091/nb/list_all.do 
     * @return
     */
    @RequestMapping(value="/nb/list_all.do", method=RequestMethod.GET )
    public ModelAndView list_all() {
      ModelAndView mav = new ModelAndView();
      
      List<NbVO> list = this.nbProc.list_all();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/nb/list_all"); // /nb/list_all.jsp
      return mav;
    }
    
    /**
     * 카테고리 그룹별 전체 목록
     * http://localhost:9091/nb/list_by_nbgrpno.do?nbgrpno=1 
     * @return
     */
    @RequestMapping(value="/nb/list_by_nbgrpno.do", method=RequestMethod.GET )
    public ModelAndView list_by_nbgrpno(int nbgrpno) {
      ModelAndView mav = new ModelAndView();
      
      List<NbVO> list = this.nbProc.list_by_nbgrpno(nbgrpno);
      mav.addObject("list", list); // request.setAttribute("list", list);

      NbgrpVO  nbgrpVO = nbgrpProc.read(nbgrpno); // 카테고리 그룹 정보
      mav.addObject("nbgrpVO", nbgrpVO); 
      
      mav.setViewName("/nb/list_by_nbgrpno_ajax"); // /nb/list_by_nbgrpno.jsp
      return mav;
    }
    
    /**
     * nbgrp + nb join, 연결 목록
     * http://localhost:9091/nb/list_all_join.do 
     * @return
     */
    @RequestMapping(value="/nb/list_all_join.do", method=RequestMethod.GET )
    public ModelAndView list_all_join() {
      ModelAndView mav = new ModelAndView();
      
      List<Nbgrp_NbVO> list = this.nbProc.list_all_join();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/nb/list_all_join"); // /WEB-INF/views/nb/list_all_join.jsp
      return mav;
    }
    
    /**
     * 조회 + 수정폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
     * http://localhost:9091/nb/read_ajax.do?nbno=1
     * {"nbgrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
     * @param nbgrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nb/read_ajax.do", 
                                method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax(int nbno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        NbVO nbVO = this.nbProc.read(nbno);

        JSONObject json = new JSONObject();
        json.put("nbno", nbVO.getNbno());
        json.put("nbgrpno", nbVO.getNbgrpno());
        json.put("name", nbVO.getName());
        json.put("rdate", nbVO.getRdate());

        return json.toString();

    }
    
    /**
     * 조회 + 수정폼 + Ajax, , VO에서 각각의 필드를 JSON으로 변환하는경우
     * http://localhost:9091/nbgrp/read_ajax.do?nbgrpno=1
     * {"nbgrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
     * @param nbgrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/nb/read_ajax2.do", 
                                method=RequestMethod.GET )
    @ResponseBody
    public String read_ajax2(int nbno) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        NbVO nbVO = this.nbProc.read(nbno);

        JSONObject json = new JSONObject();
        json.put("nbno", nbVO.getNbno());
        json.put("nbgrpno", nbVO.getNbgrpno());
        json.put("name", nbVO.getName());
        json.put("rdate", nbVO.getRdate());
        
        /*
         * int count_by_nbno = this.contentsProc.count_by_nbno(nbno);
         * json.put("count_by_nbno", count_by_nbno);
         */

        return json.toString();

    }
    
    /**
     * 수정 처리
     * 
     * @param nbVO
     * @return
     */
    @RequestMapping(value = "/nb/update.do", method = RequestMethod.POST)
    public ModelAndView update(NbVO nbVO) {
      ModelAndView mav = new ModelAndView();

      int cnt = this.nbProc.update(nbVO);
      
      if (cnt == 1) {
          mav.addObject("nbgrpno", nbVO.getNbgrpno());
          mav.setViewName("redirect:/nb/list_by_nbgrpno.do");
      } else {
          mav.addObject("code", "update_fail"); // request에 저장
          mav.addObject("cnt", cnt); // request에 저장
          mav.addObject("nbno", nbVO.getNbno());
          mav.addObject("nbgrpno", nbVO.getNbgrpno());
          mav.addObject("name", nbVO.getName());
          mav.addObject("url", "/nb/msg");  // /nb/msg -> /nb/msg.jsp로 최종 실행됨.
          
          mav.setViewName("/nb/msg");
      }  
      return mav;
    }
    
    /**
     * 조회 + 삭제폼 http://localhost:9091/nb/read_delete.do?nbno=
     * 
     * @return
     */
    @RequestMapping(value = "/nb/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int nbno) {
      // int nbno = Integer.parseInt(request.getParameter("nbno"));
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/nb/read_delete"); // read_delete.jsp

      NbVO nbVO = this.nbProc.read(nbno);
      mav.addObject("nbVO", nbVO);
      // request.setAttribute("nbVO", nbVO);
      int nbgrpno = nbVO.getNbgrpno();
      
      NbgrpVO nbgrpVO = this.nbgrpProc.read(nbgrpno);
      mav.addObject("nbgrpVO", nbgrpVO);

      List<NbVO> list = this.nbProc.list_by_nbgrpno(nbgrpno);
      mav.addObject("list", list);

      return mav; // forward
    }
    
    /**
     * 삭제 처리
     * 
     * @param nbVO
     * @return
     */
    @RequestMapping(value = "/nb/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int nbno) {
      ModelAndView mav = new ModelAndView();
      // 삭제될 레코드 정보를 삭제하기전에 읽음
      NbVO nbVO = this.nbProc.read(nbno); 
      
      int cnt = this.nbProc.delete(nbno);
      
      if (cnt == 1) {
          mav.addObject("nbgrpno", nbVO.getNbgrpno());
          mav.setViewName("redirect:/nb/list_by_nbgrpno.do");
      } else {
          mav.addObject("code", "delete_fail"); // request에 저장
          mav.addObject("cnt", cnt); // request에 저장
          mav.addObject("nbno", nbVO.getNbno());
          mav.addObject("nbgrpno", nbVO.getNbgrpno());
          mav.addObject("name", nbVO.getName());
          mav.addObject("url", "/nb/msg");  // /nb/msg -> /nb/msg.jsp로 최종 실행됨.
          
          mav.setViewName("/nb/msg"); // /WEB-INF/views/nb/msg.jsp
          
      }
      
      return mav;
    }
}