package dev.mvc.team4_v2sbm3c;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.nb.NbProcInter;
import dev.mvc.nb.NbVO;
import dev.mvc.nbgrp.NbgrpProcInter;
import dev.mvc.nbgrp.NbgrpVO;

@Controller
public class HomeCont {

@Autowired
@Qualifier("dev.mvc.nbgrp.NbgrpProc") // @Component("dev.mvc.nbgrp.NbgrpProc")
private NbgrpProcInter nbgrpProc;

@Autowired
@Qualifier("dev.mvc.nb.NbProc") 
private NbProcInter nbProc;

@Autowired
@Qualifier("dev.mvc.contents.ContentsProc")
private ContentsProcInter contentsProc;
    
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }

  // http://localhost:9091
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    
    List<NbVO> list = this.nbProc.list_all();
    mav.addObject("list", list);
    
    mav.setViewName("/index");  // /WEB-INF/views/index.jsp
    
    return mav;
  }
  

  
}