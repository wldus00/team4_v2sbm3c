package dev.mvc.recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TensorflowCont {
    public TensorflowCont() {
        System.out.println("-> TensorflowCont created.");
    }
    
    
    // http://localhost:9091/recommend/recommend_nb/start.do
    @RequestMapping(value = {"/recommend/recommend_nb/start.do"}, method = RequestMethod.GET)
    public ModelAndView start() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/start");  // /WEB-INF/views/recommend/recommend_book/start.jsp
        
        return mav;
    }
    
    // http://localhost:9091/recommend/recommend_nb/form1.do
    @RequestMapping(value = {"/recommend/recommend_nb/form1.do"}, method = RequestMethod.GET)
    public ModelAndView form1() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/form1");  // /WEB-INF/views/recommend/recommend_book/form1.jsp
        
        return mav;
    }

    // http://localhost:9091/recommend/recommend_nb/form2.do
    @RequestMapping(value = {"/recommend/recommend_nb/form2.do"}, method = RequestMethod.GET)
    public ModelAndView form2() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/form2");  // /WEB-INF/views/recommend/recommend_book/form2.jsp
    
        return mav;
    }

    // http://localhost:9091/recommend/recommend_nb/form3.do
    @RequestMapping(value = {"/recommend/recommend_nb/form3.do"}, method = RequestMethod.GET)
    public ModelAndView form3() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/form3");  // /WEB-INF/views/recommend/recommend_book/form3.jsp
        
        return mav;
    }
  
    //http://localhost:9091/recommend/recommend_nb/form3.do
    @RequestMapping(value = {"/recommend/recommend_nb/form4.do"}, method = RequestMethod.GET)
    public ModelAndView form4() {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/recommend/recommend_nb/form4");  // /WEB-INF/views/recommend/recommend_book/form3.jsp
       
         return mav;
    }
    
    //http://localhost:9091/recommend/recommend_nb/form3.do
    @RequestMapping(value = {"/recommend/recommend_nb/form5.do"}, method = RequestMethod.GET)
    public ModelAndView form5() {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/recommend/recommend_nb/form5");  // /WEB-INF/views/recommend/recommend_book/form3.jsp
       
         return mav;
    }

    // http://localhost:9091/recommend/recommend_nb/end.do
    @RequestMapping(value = {"/recommend/recommend_nb/end.do"}, method = RequestMethod.GET)
    public ModelAndView end() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/end");  // /WEB-INF/views/recommend/recommend_book/end.jsp
        
        return mav;
    }
    
    // http://localhost:9091/recommend/recommend_nb_req/start.do
    @RequestMapping(value = {"/recommend/recommend_nb_req/start.do"}, method = RequestMethod.GET)
    public ModelAndView req_start() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/req_start");  // /WEB-INF/views/recommend/recommend_book/end.jsp
        
        return mav;
    }
    
    // http://localhost:9091/recommend/recommend_nb_req/end.do
    @RequestMapping(value = {"/recommend/recommend_nb_req/end.do"}, method = RequestMethod.GET)
    public ModelAndView req_end() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend/recommend_nb/req_end");  // /WEB-INF/views/recommend/recommend_book/end.jsp
        
        return mav;
    }

}


