package dev.mvc.ytgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




@Controller public class YtgrpCont {
	  @Autowired
	  @Qualifier("dev.mvc.ytgrp.YtgrpProc") private YtgrpProcInter ytgrpProc;
	  public YtgrpCont()
	  { 
		  System.out.println("-> ytgrpCont created.");
		  }
	 
	  
	  // http://localhost:9091/ytgrp/create.do
	 /**
		 * ��� ��
		 * 
		 * @return
		 */

	  @RequestMapping(value = "/ytgrp/create.do", method = RequestMethod.GET)
	  public ModelAndView create() {
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("/ytgrp/create");
		  return mav; 
	  }
	  // http://localhost:9091/urlgrp/create.do
	  /**
	   * ��� ó��
	   * urlgrpVO urlgrpVO ��ü���� �ʵ���� <form> �±׿� �����ϸ� �ڵ����� setter ȣ���. 
	   * <form> �±׿� �����ϴ� ������ urlgrpVO urlgrpVO ��ü���� �ʵ忡 setter�� �̿��Ͽ� �ڵ� �Ҵ��. 
	   * @param urlgrpVO
	   * @return
	   */
	  @RequestMapping(value = "/ytgrp/create.do", method = RequestMethod.POST)
	  public ModelAndView create(YtgrpVO ytgrpVO) { // urlgrpVO �ڵ� ����, Form -> VO
	      // urlgrpVO urlgrpVO <FORM> �±��� ������ �ڵ� ������.
	      // request.setAttribute("urlgrpVO", urlgrpVO); �ڵ� ����

	      ModelAndView mav = new ModelAndView();

	      int cnt = this.ytgrpProc.create(ytgrpVO); // ��� ó��
	      // cnt = 0; // error test
	      
	      mav.addObject("cnt", cnt);
	     
	      if (cnt == 1) {
	          // System.out.println("��� ����");
	          
	          // mav.addObject("code", "create_success"); // request�� ����, request.setAttribute("code", "create_success")
	          // mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
	          
	          // response.sendRedirect("/categrp/list.do");
	          mav.setViewName("redirect:/ytgrp/list.do");
	      } else {
	          mav.addObject("code", "create_fail"); // request�� ����, request.setAttribute("code", "create_fail")
	          mav.setViewName("/ytgrp/msg"); // /WEB-INF/views/categrp/msg.jsp
	      }

	      return mav; // forward
	  }
	// http://localhost:9091/ytgrp/list.do
		
		  @RequestMapping(value="/ytgrp/list.do", method=RequestMethod.GET ) public
		  ModelAndView list() { ModelAndView mav = new ModelAndView();
		  
		  List<YtgrpVO> list = this.ytgrpProc.list_ytgrpno_asc();
		  mav.addObject("list", list); // request.setAttribute("list", list);
		  
		  mav.setViewName("/ytgrp/list"); // /webapp/WEB-INF/views/categrp/list.jsp
		  return mav; }
		// http://localhost:9091/categrp/read_update.do?categrpno=1
		  /**
		     * 조회 + 수정폼 http://localhost:9091/cate/read_update.do
		     * 
		     * @return
		     */
		  @RequestMapping(value="/ytgrp/read_update.do", method=RequestMethod.GET )
		  public ModelAndView read_update(int ytgrpno) {
		    // request.setAttribute("categrpno", int categrpno) �۵� �ȵ�.
		    
		    ModelAndView mav = new ModelAndView();
		    
		    YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno);
		    mav.addObject("ytgrpVO", ytgrpVO);  // request ��ü�� ����
		    
		    List<YtgrpVO> list = this.ytgrpProc.list_ytgrpno_asc();
		    mav.addObject("list", list);  // request ��ü�� ����

		    mav.setViewName("/ytgrp/read_update"); // /WEB-INF/views/categrp/read_update.jsp 
		    return mav; // forward
		  }
		   
		//http://localhost:9091/ytgrp/update.do
		  /**
		     * 수정 처리
		     * 
		     * @param cateVO
		     * @return
		     */
		  @RequestMapping(value = "/ytgrp/update.do", method = RequestMethod.POST)
		  public ModelAndView update(YtgrpVO ytgrpVO) {
			 
		        ModelAndView mav = new ModelAndView();

		        int cnt = this.ytgrpProc.update(ytgrpVO);
		        mav.addObject("cnt", cnt); // request에 저장

		        // cnt = 0; // error test
		        if (cnt == 1) {
		            // System.out.println("수정 성공");
		            // response.sendRedirect("/categrp/list.do");
		            mav.setViewName("redirect:/ytgrp/list.do");
		        } else {
		            mav.addObject("code", "update_fail"); // request에 저장, request.setAttribute("code", "update_fail")
		            mav.setViewName("/ytgrp/msg"); // /WEB-INF/views/categrp/msg.jsp
		        }


		      return mav;
		  }
		  // http://localhost:9091/categrp/read_delete.do
		    /**
		     * 조회 + 삭제폼
		     * @param categrpno 조회할 카테고리 번호
		     * @return
		     */
		  @RequestMapping(value="/ytgrp/read_delete.do", method=RequestMethod.GET )
		  public ModelAndView read_delete(int ytgrpno) {
		    ModelAndView mav = new ModelAndView();
		    
		    YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno); // ������ �ڷ� �б�
		    mav.addObject("ytgrpVO", ytgrpVO);  // request ��ü�� ����
		    
		    List<YtgrpVO> list = this.ytgrpProc.list_ytgrpno_asc();
		    mav.addObject("list", list);  // request ��ü�� ����

		    mav.setViewName("/ytgrp/read_delete"); // read_delete.jsp
		    return mav;
		  }
		 
		  // http://localhost:9091/ytgrp/delete.do
    /**
     * 삭제
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
		  @RequestMapping(value="/ytgrp/delete.do", method=RequestMethod.POST )
		  public ModelAndView delete(int ytgrpno) {
		    ModelAndView mav = new ModelAndView();
		    
		    YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno); //  삭제 정보
		    mav.addObject("ytgrpVO", ytgrpVO);  // request 객체에 저장
		    
		    int cnt = this.ytgrpProc.delete(ytgrpno); // 삭제 처리
		    mav.addObject("cnt", cnt);  // request 객체에 저장
		      
		    
		   // mav.setViewName("/ytgrp/delete_msg"); // delete_msg.jsp
		    mav.setViewName("redirect:/ytgrp/list.do");
		    return mav;
		  }
}