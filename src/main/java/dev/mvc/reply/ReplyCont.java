package dev.mvc.reply;

import java.util.HashMap;
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

import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberVO;

@Controller
public class ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc") // 이름 지정
  private ReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") // 이름 지정
  private MemberProc memberProc;
  
  public ReplyCont(){
    System.out.println("-> ReplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/reply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReplyVO replyVO) {
    int cnt = replyProc.create(replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("cnt",cnt);
 
    return obj.toString(); // {"cnt":1}

  }
  


  /**
   * @param noticeno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_noticeno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_noticeno(int noticeno) {
    List<ReplyVO> list = replyProc.list_by_noticeno(noticeno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * http://localhost:9091/reply/list_by_noticeno_join.do?noticeno=1
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_noticeno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_noticeno_join(int noticeno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<ReplyMemberVO> list = replyProc.list_by_noticeno_join(noticeno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  

  
  
  /**
   * 패스워드를 검사한 후 삭제 
   * http://localhost:9091/reply/delete.do?replyno=1&passwd=1234
   * {"delete_cnt":0,"passwd_cnt":0}
   * {"delete_cnt":1,"passwd_cnt":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reply/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int replyno, String passwd) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("replyno", replyno);
    map.put("passwd", passwd);
    
    int passwd_cnt = replyProc.checkPasswd(map); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    int delete_cnt = 0;                                    // 삭제된 댓글
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우
      delete_cnt = replyProc.delete(replyno); // 댓글 삭제
    }
    
    JSONObject obj = new JSONObject();
    obj.put("passwd_cnt", passwd_cnt); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    obj.put("delete_cnt", delete_cnt); // 삭제된 댓글
    
    return obj.toString();
  }
}