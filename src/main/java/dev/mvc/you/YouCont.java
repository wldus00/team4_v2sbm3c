package dev.mvc.you;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.ytgrp.YtgrpProcInter;
import dev.mvc.ytgrp.YtgrpVO;

@Controller
public class YouCont {
	@Autowired
	@Qualifier("dev.mvc.ytgrp.YtgrpProc") // @Component("dev.mvc.categrp.CategrpProc")
	private YtgrpProcInter ytgrpProc;

	@Autowired
	@Qualifier("dev.mvc.you.YouProc") // @Component("dev.mvc.cate.CateProc")
	private YouProcInter youProc;

	public YouCont() {
		System.out.println("-> YouCont created.");
	}

	/**
	 * ����� http://localhost:9091/you/create.do?yougrpno=2
	 * 
	 * @return
	 */
	@RequestMapping(value = "/you/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/you/create"); // /webapp/WEB-INF/views/cate/create.jsp

		return mav;
	}

	/**
     * 등록처리
     * CateVO cateVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨.
     * <form> 태그에 존재하는 값들은 CateVO cateVO 객체안의 필드에 setter를 이용하여 자동 할당됨.  
     * http://localhost:9091/cate/create.do?categrpno=2
     * Exception: FK 전달이 안됨.
     * Field error in object 'cateVO' on field 'categrpno': rejected value [];
     * codes [typeMismatch.cateVO.categrpno,typeMismatch.categrpno,typeMismatch.int,typeMismatch]; 
     * arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [cateVO.categrpno,categrpno];
     * arguments []; default message [categrpno]]; 
     * default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'categrpno';
     * nested exception is java.lang.NumberFormatException: For input string: ""]]
     * @return
     */
	@RequestMapping(value = "/you/create.do", method = RequestMethod.POST)
	public ModelAndView create(YouVO youVO) {
		 ModelAndView mav = new ModelAndView();

	        int cnt = this.youProc.create(youVO); // 등록 처리
	        // cnt = 0; // error test
	        
	        mav.addObject("cnt", cnt);
	       
	        if (cnt == 1) {
	            // System.out.println("등록 성공");
	            
	            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
	            // mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
	            
	            // response.sendRedirect("/categrp/list.do");
	            mav.setViewName("redirect:/you/list_all.do");
	        } else {
	            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
	            mav.setViewName("/you/msg"); // /WEB-INF/views/categrp/msg.jsp
	        }

	        return mav; // forward
	    }


	/**
	 * 조회 http://localhost:9091/you/list_all.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/you/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all() {
		ModelAndView mav = new ModelAndView();

		List<YouVO> list = this.youProc.list_all();
		mav.addObject("list", list); // request.setAttribute("list", list);
		
		
		mav.setViewName("/you/list_all"); // /cate/list_all.jsp
		return mav;
	}

	/**
	 * ī�װ� �׷캰 ��ü ��� http://localhost:9091/you/list_by_yougrpno.do?yougrpno=1
	 * 
	 * @param categrpno Ư�� �׷쿡 �Ҽӵ� ī�װ��� ����� ī�װ� �׷� ��ȣ
	 * @return
	 */
	@RequestMapping(value = "/you/list_by_ytgrpno.do", method = RequestMethod.GET)
	public ModelAndView list_by_ytgrpno(int ytgrpno) {
		ModelAndView mav = new ModelAndView();

		List<YouVO> list = this.youProc.list_by_ytgrpno(ytgrpno);
		mav.addObject("list", list); // request.setAttribute("list", list);

		YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno); // ī�װ� �׷� ����
		mav.addObject("ytgrpVO", ytgrpVO);

		mav.setViewName("you/list_by_ytgrpno"); // /cate/list_by_categrpno.jsp
		return mav;
	}

	/**
	 * 조회 + 수정http://localhost:9091/cate/read_update.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/you/read_update.do", method = RequestMethod.GET)
	public ModelAndView read_update(int youno) {
		// int cateno = Integer.parseInt(request.getParameter("cateno"));

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/you/read_update"); // read_update.jsp

		// ī�װ� ����
		YouVO youVO = this.youProc.read(youno);
		mav.addObject("youVO", youVO);
		// request.setAttribute("cateVO", cateVO);

		int ytgrpno = youVO.getYtgrpno();

		// ī�װ� �׷� ����
		YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno);
		mav.addObject("ytgrpVO", ytgrpVO);

		// ī�װ� ���
		List<YouVO> list = this.youProc.list_by_ytgrpno(ytgrpno);
		mav.addObject("list", list);

		return mav; // forward
	}

	/**
	 *  수정
	 * 
	 * @param cateVO
	 * @return
	 */
	@RequestMapping(value = "/you/update.do", method = RequestMethod.POST)
	public ModelAndView update(YouVO youVO) {
		ModelAndView mav = new ModelAndView();

		int cnt = this.youProc.update(youVO);

		if (cnt == 1) {
			mav.addObject("ytgrpno", youVO.getYtgrpno());
			mav.setViewName("redirect:/you/list_by_ytgrpno.do");
		} else {
			mav.addObject("code", "update_fail"); // request�� ����
			mav.addObject("cnt", cnt); // request�� ����
			mav.addObject("youno", youVO.getYouno());
			mav.addObject("ytgrpno", youVO.getYtgrpno());
			mav.addObject("title", youVO.getTitle());
			mav.addObject("url", youVO.getUrl());
			mav.addObject("url", "/youmsg"); // /cate/msg -> /cate/msg.jsp�� ���� �����.

			mav.setViewName("/you/msg"); // /WEB-INF/views/cate/msg.jsp

		}

		return mav;
	}

	/**
	 * 삭제 +조회 http://localhost:9091/you/read_delete.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/you/read_delete.do", method = RequestMethod.GET)
	public ModelAndView read_delete(int youno) {
		// int cateno = Integer.parseInt(request.getParameter("cateno"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/you/read_delete"); // read_delete.jsp

		YouVO youVO = this.youProc.read(youno);
		mav.addObject("youVO", youVO);
		// request.setAttribute("cateVO", cateVO);
		int ytgrpno = youVO.getYtgrpno();

		YtgrpVO ytgrpVO = this.ytgrpProc.read(ytgrpno);
		mav.addObject("ytgrpVO", ytgrpVO);

		List<YouVO> list = this.youProc.list_by_ytgrpno(ytgrpno);
		mav.addObject("list", list);

		return mav; // forward
	}

	/**
	 * 삭제
	 * 
	 * @param cateVO
	 * @return
	 */
	@RequestMapping(value = "/you/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(int youno) {
		ModelAndView mav = new ModelAndView();
		// ������ ���ڵ� ������ �����ϱ����� ����
		YouVO youVO = this.youProc.read(youno);

		int cnt = this.youProc.delete(youno);

		if (cnt == 1) {
			mav.addObject("ytgrpno", youVO.getYtgrpno());
			mav.setViewName("redirect:/you/list_by_ytgrpno.do");
		} else {
			mav.addObject("code", "delete_fail"); // request�� ����
			mav.addObject("cnt", cnt); // request�� ����
			mav.addObject("youno", youVO.getYouno());
			mav.addObject("ctgrpno", youVO.getYtgrpno());
			mav.addObject("title", youVO.getTitle());
			mav.addObject("url", "/you/msg"); // /cate/msg -> /cate/msg.jsp�� ���� �����.

			mav.setViewName("/you/msg"); // /WEB-INF/views/cate/msg.jsp

		}

		return mav;
	}
	  /**
	   * Grid 형태의 화면 구성 http://localhost:9091/you/list_by_ytgrpno_grid.do?ytgrpno=8
	   * 
	   * @return
	   */
	  @RequestMapping(value = "/you/list_by_ytgrpno_grid.do", method = RequestMethod.GET)
	  public ModelAndView list_by_youno_grid(int ytgrpno) {
	    ModelAndView mav = new ModelAndView();
	    
	    YouVO youVO = this.youProc.read(ytgrpno);
	    mav.addObject("youVO",youVO);
	    
	    YtgrpVO ytgrpVO = this.ytgrpProc.read(youVO.getYtgrpno());
	    mav.addObject("ytgrpVO", ytgrpVO);
	    
	    List<YouVO> list = this.youProc.list_by_ytgrpno(ytgrpno);
	    mav.addObject("list", list);

	    // 테이블 이미지 기반, /webapp/contents/list_by_cateno_grid.jsp
	    mav.setViewName("/you/list_by_ytgrpno_grid");

	    return mav; // forward
	  }
}