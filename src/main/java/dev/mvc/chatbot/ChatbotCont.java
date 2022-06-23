package dev.mvc.chatbot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatbotCont {
	public ChatbotCont(){
	   System.out.println("-> chatbotCont created.");
	}
	// http://localhost:9091, http://localhost:9091/chatbot/chatbot.do
	  @RequestMapping(value = {"/chatbot/chatbot.do"}, method = RequestMethod.GET)
	  public ModelAndView home() {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/chatbot/chatbot");  // /WEB-INF/views/index.jsp
	    
	    return mav;
	}
	// http://localhost:9091, http://localhost:9091/chatbot/chatting_intent.do
		  @RequestMapping(value = {"/chatbot/chatting_intent.do"}, method = RequestMethod.GET)
		  public ModelAndView view() {
		    ModelAndView mav = new ModelAndView();
		    mav.setViewName("/chatbot/chatting_intent");  // /WEB-INF/views/index.jsp
		    
		    return mav;
		}
	 
}