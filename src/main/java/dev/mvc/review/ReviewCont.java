package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.nbgrp.NbgrpProcInter;
import dev.mvc.nbgrp.NbgrpVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberVO;
import dev.mvc.nb.NbProcInter;
import dev.mvc.nb.NbVO;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.nbgrp.NbgrpProc")
  private NbgrpProcInter nbgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.nb.NbProc")
  private NbProcInter nbProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc") // 이름 지정
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") // 이름 지정
  private MemberProc memberProc;
  
  public ReviewCont(){
    System.out.println("-> ReviewCont created.");
  }
  
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/review/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  @ResponseBody
  @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
  public ModelAndView create(int contentsno) {
      ModelAndView mav = new ModelAndView();
      
      ContentsVO contentsVO = this.contentsProc.read(contentsno);
      NbVO nbVO = this.nbProc.read(contentsVO.getNbno());
      NbgrpVO nbgrpVO = this.nbgrpProc.read(nbVO.getNbgrpno());
      
      mav.addObject("contentsVO", contentsVO);
      mav.addObject("nbVO", nbVO);
      mav.addObject("nbgrpVO", nbgrpVO);
      
      mav.setViewName("/review/create"); // /webapp/WEB-INF/views/contents/create.jsp

      return mav; // forward
    }
  
  /**
   * 등록 처리 http://localhost:9091/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();
    
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 시작
    // ------------------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file1saved = "";  // 저장된 파일명, image
    String thumb1 = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir"); // 시스템 제공

    String upDir =  user_dir + "/src/main/resources/static/review/storage/"; // 절대 경로

    MultipartFile mf = reviewVO.getFile1MF();
    
    file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
    
    long size1 = mf.getSize();  // 파일 크기
    
    if (size1 > 0) { // 파일 크기 체크
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        thumb1 = Tool.preview(upDir, file1saved, 150, 150); 
      }
    }    
    
    reviewVO.setFile1(file1);
    reviewVO.setFile1saved(file1saved);
    reviewVO.setThumb1(thumb1);
    reviewVO.setSize1(size1);
   
    int cnt = this.reviewProc.create(reviewVO); 
    
    if (cnt == 1) {
        mav.addObject("code", "create_success");
    } else {
        mav.addObject("code", "create_fail");
    }
    mav.addObject("cnt", cnt); 

    mav.addObject("contentsno", reviewVO.getContentsno()); // redirect parameter 적용
    mav.addObject("url", "/review/msg"); // msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/review/msg.do"); 
    
    return mav; // forward
  }
  
  @RequestMapping(value="/review/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
      List<ReviewVO> list = reviewProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/review/list"); // /webapp/reply/list.jsp
    
    return mav;
  }
  
  @RequestMapping(value = "/review/list_join.do", method = RequestMethod.GET)
  public ModelAndView list_join(int contentsno) { 
    ModelAndView mav = new  ModelAndView(); 
    mav.setViewName("/review/list_join");
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    NbVO nbVO = this.nbProc.read(contentsVO.getNbno());
    NbgrpVO nbgrpVO = this.nbgrpProc.read(nbVO.getNbgrpno());
    
    mav.addObject("contentsVO", contentsVO);
    mav.addObject("nbVO", nbVO);
    mav.addObject("nbgrpVO", nbgrpVO);
    
    List<ReviewMemberVO> list = this.reviewProc.list_join(contentsno);
    mav.addObject("list", list);
    
    return mav; // forward 
  }
  
  @ResponseBody
  @RequestMapping(value = "/review/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int reviewno, String passwd) {
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("reviewno", reviewno);
    map.put("passwd", passwd);
    
    int passwd_cnt = reviewProc.checkPasswd(map); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    int delete_cnt = 0;                                    // 삭제된 댓글
    if (passwd_cnt == 1) { // 패스워드가 일치할 경우
      delete_cnt = reviewProc.delete(reviewno); // 댓글 삭제
    }
    
    JSONObject obj = new JSONObject();
    obj.put("passwd_cnt", passwd_cnt); // 패스워드 일치 여부, 1: 일치, 0: 불일치
    obj.put("delete_cnt", delete_cnt); // 삭제된 댓글
    
    return obj.toString();
  }

}