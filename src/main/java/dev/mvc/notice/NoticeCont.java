package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class NoticeCont {
    @Autowired
    @Qualifier("dev.mvc.notice.NoticeProc")
    private NoticeProcInter noticeProc;
    
    public NoticeCont() {
        System.out.println("-> NoticeCont created.");
    }
    
    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/notice/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward

        return mav; // forward
    }
    
    /**
     * 등록폼
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();


        mav.setViewName("/notice/create"); // /webapp/WEB-INF/views/notice/create.jsp

        return mav; // forward
    }
    
    /**
     * 등록 처리 http://localhost:9091/notice/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, NoticeVO noticeVO) {
      ModelAndView mav = new ModelAndView();
      
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String file1 = "";          // 원본 파일명 image
      String file1saved = "";  // 저장된 파일명, image
      String thumb1 = "";     // preview image

      // 기준 경로 확인
      String user_dir = System.getProperty("user.dir"); // 시스템 제공
      // System.out.println("-> User dir: " + user_dir);
      //  --> User dir: C:\kd1\ws_java\resort_v1sbm3c
      
      // 파일 접근임으로 절대 경로 지정, static 폴더 지정
      // 완성된 경로 C:/kd1/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
      String upDir =  user_dir + "/src/main/resources/static/contents/storage/"; // 절대 경로
      // System.out.println("-> upDir: " + upDir);
      
      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택">
      MultipartFile mf = noticeVO.getFile1MF();
      
      file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
      // System.out.println("-> file1: " + file1);
      
      long size1 = mf.getSize();  // 파일 크기
      
      if (size1 > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file1saved = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(file1saved)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
        }
        
      }    
      
      noticeVO.setFile1(file1);
      noticeVO.setFile1saved(file1saved);
      noticeVO.setThumb1(thumb1);
      noticeVO.setSize1(size1);
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------
      
      // Call By Reference: 메모리 공유, Hashcode 전달
      int cnt = this.noticeProc.create(noticeVO); 
      
      if (cnt == 1) {
          mav.addObject("code", "create_success");
          // noticeProc.increaseCnt(noticeVO.getNoticeno()); // 글수 증가
      } else {
          mav.addObject("code", "create_fail");
      }
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
      // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
      // mav.addObject("noticeno", noticeVO.getNoticeno()); // redirect parameter 적용
      mav.addObject("url", "/notice/msg"); // msg.jsp, redirect parameter 적용

      mav.setViewName("redirect:/notice/msg.do"); 
      
      return mav; // forward
      
    }
    
    /**
     * 카테고리별 목록 http://localhost:9091/notice/list_by_noticeno.do?noticeno=1
     * 
     * @return
     */
     @RequestMapping(value = "/notice/list_by_notice.do", method = RequestMethod.GET)
      public ModelAndView list_by_notice() { 
        ModelAndView mav = new  ModelAndView(); 
        
        List<NoticeVO> list = this.noticeProc.list_by_notice();

        mav.addObject("list", list);
        
        mav.setViewName("/notice/list_by_notice");
        return mav; // forward 
      }

    
     // http://localhost:9091/contents/read.do
     /**
      * 조회
      * @return
      */
     @RequestMapping(value="/notice/read.do", method=RequestMethod.GET )
     public ModelAndView read_ajax(HttpServletRequest request, int noticeno) {
       
       
       int notice_cnt = this.noticeProc.views(noticeno);
       
       List<NoticeVO> list = this.noticeProc.list_by_notice();
       
         
       ModelAndView mav = new ModelAndView();
       
       NoticeVO noticeVO = this.noticeProc.read(noticeno);
       mav.addObject("list", list);
       mav.addObject("notice_cnt", notice_cnt);
       mav.addObject("noticeVO", noticeVO); // request.setAttribute("noticeVO", noticeVO);
       
       // 단순 read
       // mav.setViewName("/contents/read"); // /WEB-INF/views/contents/read.jsp
       
       // 쇼핑 기능 추가
       // mav.setViewName("/contents/read_cookie"); // /WEB-INF/views/contents/read_cookie.jsp
       
       // 댓글 기능 추가 
       mav.setViewName("/notice/read"); // /WEB-INF/views/contents/read_cookie_reply.jsp
       
       // -------------------------------------------------------------------------------
       // 쇼핑 카트 장바구니에 상품 등록전 로그인 폼 출력 관련 쿠기  
       // -------------------------------------------------------------------------------
       Cookie[] cookies = request.getCookies();
       Cookie cookie = null;

       String ck_id = ""; // id 저장
       String ck_id_save = ""; // id 저장 여부를 체크
       String ck_passwd = ""; // passwd 저장
       String ck_passwd_save = ""; // passwd 저장 여부를 체크

       if (cookies != null) {  // Cookie 변수가 있다면
         for (int i=0; i < cookies.length; i++){
           cookie = cookies[i]; // 쿠키 객체 추출
           
           if (cookie.getName().equals("ck_id")){
             ck_id = cookie.getValue();                                 // Cookie에 저장된 id
           }else if(cookie.getName().equals("ck_id_save")){
             ck_id_save = cookie.getValue();                          // Cookie에 id를 저장 할 것인지의 여부, Y, N
           }else if (cookie.getName().equals("ck_passwd")){
             ck_passwd = cookie.getValue();                          // Cookie에 저장된 password
           }else if(cookie.getName().equals("ck_passwd_save")){
             ck_passwd_save = cookie.getValue();                  // Cookie에 password를 저장 할 것인지의 여부, Y, N
           }
         }
       }
       
       System.out.println("-> ck_id: " + ck_id);
       
       mav.addObject("ck_id", ck_id); 
       mav.addObject("ck_id_save", ck_id_save);
       mav.addObject("ck_passwd", ck_passwd);
       mav.addObject("ck_passwd_save", ck_passwd_save);
       // -------------------------------------------------------------------------------
       
       return mav;
     }
     
     /**
      * 수정 폼
      * http://localhost:9091/notice/update_text.do?noticeno=1
      * 
      * @return
      */
     @RequestMapping(value = "/notice/update_text.do", method = RequestMethod.GET)
     public ModelAndView update_text(int noticeno) {
       ModelAndView mav = new ModelAndView();
       
       NoticeVO noticeVO = this.noticeProc.read(noticeno);
       
       mav.addObject("noticeVO", noticeVO);
       
       mav.setViewName("/notice/update_text"); 

       return mav; // forward
     }
     
     /**
      * 수정 처리
      * http://localhost:9091/notice/update_text.do?noticeno=1
      * 
      * @return
      */
     @RequestMapping(value = "/notice/update_text.do", method = RequestMethod.POST)
     public ModelAndView update_text(NoticeVO noticeVO) {
       ModelAndView mav = new ModelAndView();
       
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("noticeno", noticeVO.getNoticeno());
       
       int cnt = 0;
       int passwd_cnt = this.noticeProc.passwd_check(map);
       System.out.println(passwd_cnt);
       if (passwd_cnt == 1) {
           cnt = this.noticeProc.update_text(noticeVO); // 수정 처리
           
           mav.addObject("noticeno", noticeVO.getNoticeno());
           mav.setViewName("redirect:/notice/read.do");             
       } else {
           mav.addObject("cnt", cnt);
           mav.addObject("code", "passwd_fail");
           mav.addObject("url", "/notice/msg"); // msg.jsp, redirect parameter 적용
           mav.setViewName("redirect:/notice/msg.do");
       }

       return mav; // forward
     }
     
     /**
      * 파일 수정 폼
      * http://localhost:9091/notice/update_file.do?noticeno=1
      * 
      * @return
      */
     @RequestMapping(value = "/notice/update_file.do", method = RequestMethod.GET)
     public ModelAndView update_file(int noticeno) {
       ModelAndView mav = new ModelAndView();
       
       NoticeVO noticeVO = this.noticeProc.read(noticeno);
       
       mav.addObject("noticeVO", noticeVO);
       
       mav.setViewName("/notice/update_file"); // /WEB-INF/views/notice/update_file.jsp

       return mav; // forward
     }

     /**
      * 파일 수정 처리 http://localhost:9091/notice/update_file.do
      * 
      * @return
      */
     @RequestMapping(value = "/notice/update_file.do", method = RequestMethod.POST)
     public ModelAndView update_file(HttpServletRequest request, NoticeVO noticeVO) {
       ModelAndView mav = new ModelAndView();
       
       // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
       NoticeVO noticeVO_old = noticeProc.read(noticeVO.getNoticeno());
       
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("noticeno", noticeVO.getNoticeno());
       
       int cnt = 0;
       // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
       // -------------------------------------------------------------------
       // 파일 삭제 코드 시작
       // -------------------------------------------------------------------
       
       String file1saved = noticeVO_old.getFile1saved(); // 실제 저장된 파일명
       String thumb1 = noticeVO_old.getThumb1();         // 실제 저장된 preview 이미지 파일명
       long size1 = 0;
       boolean sw = false;
       
       // 완성된 경로 C:/kd/ws_java/team4_v2sbm3c/src/main/resources/static/contents/storage/
       String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로

       sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
       sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
       // System.out.println("sw: " + sw);
       // -------------------------------------------------------------------
       // 파일 삭제 종료 시작
       // -------------------------------------------------------------------
       
       // -------------------------------------------------------------------
       // 파일 전송 코드 시작
       // -------------------------------------------------------------------
       String file1 = "";          // 원본 파일명 image

       // 완성된 경로 C:/kd/ws_java/team4_v2sbm3c/src/main/resources/static/contents/storage/
       // String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로
       
       // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
       // <input type='file' class="form-control" name='file1MF' id='file1MF' 
       //           value='' placeholder="파일 선택">
       MultipartFile mf = noticeVO.getFile1MF();
       
       file1 = mf.getOriginalFilename(); // 원본 파일명
       size1 = mf.getSize();  // 파일 크기
       
       if (size1 > 0) { // 파일 크기 체크
         // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
         file1saved = Upload.saveFileSpring(mf, upDir); 
         
         if (Tool.isImage(file1saved)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
           thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
         }
         
       } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
           file1="";
           file1saved="";
           thumb1="";
           size1=0;
       }
       
       noticeVO.setFile1(file1);
       noticeVO.setFile1saved(file1saved);
       noticeVO.setThumb1(thumb1);
       noticeVO.setSize1(size1);
       // -------------------------------------------------------------------
       // 파일 전송 코드 종료
       // -------------------------------------------------------------------
       
       // Call By Reference: 메모리 공유, Hashcode 전달
       cnt = this.noticeProc.update_file(noticeVO);
       System.out.println("-> cnt: " + cnt);
       
       mav.addObject("noticeno", noticeVO.getNoticeno());
       mav.setViewName("redirect:/notice/read.do"); // request -> param으로 접근 전환
       
       return mav; // forward
     }   
     
     /**
      * 삭제 폼
      * @param noticeno
      * @return
      */
     @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
     public ModelAndView delete(int noticeno) { 
       ModelAndView mav = new  ModelAndView();
       
       // 삭제할 정보를 조회하여 확인
       NoticeVO noticeVO = this.noticeProc.read(noticeno);
       
       mav.addObject("noticeVO", noticeVO);
       
       mav.setViewName("/notice/delete");  // notice/delete.jsp
       
       return mav; 
     }

     /**
      * 삭제 처리 http://localhost:9091/notice/delete.do
      * 
      * @return
      */
     @RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
     public ModelAndView delete(HttpServletRequest request, NoticeVO noticeVO) {
       ModelAndView mav = new ModelAndView();
       int noticeno = noticeVO.getNoticeno();
       
       HashMap<String, Object> passwd_map = new HashMap<String, Object>();
       passwd_map.put("noticeno", noticeVO.getNoticeno());
       
       
       int cnt = 0;
       int passwd_cnt = this.noticeProc.passwd_check(passwd_map);
       if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
           // -------------------------------------------------------------------
           // 파일 삭제 코드 시작
           // -------------------------------------------------------------------
           // 삭제할 파일 정보를 읽어옴.
           NoticeVO vo = noticeProc.read(noticeno);
           
           String file1saved = vo.getFile1saved();
           String thumb1 = vo.getThumb1();
           long size1 = 0;
           boolean sw = false;
           
           // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage/
           String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로

           sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
           sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
           // System.out.println("sw: " + sw);
           // -------------------------------------------------------------------
           // 파일 삭제 종료 시작
           // -------------------------------------------------------------------
           
           cnt = this.noticeProc.delete(noticeno); // DBMS 삭제
           
           // -------------------------------------------------------------------------------------

           
           // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
           // 10번째 레코드를 삭제후
           // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
           // 페이지수를 4 -> 3으로 감소 시켜야함.

           // -------------------------------------------------------------------------------------
           
           mav.setViewName("redirect:/notice/list_by_notice.do"); 

       } else { // 패스워드 오류
           mav.addObject("cnt", cnt);
           mav.addObject("code", "passwd_fail");
           mav.addObject("url", "/notice/msg"); // msg.jsp, redirect parameter 적용
           mav.setViewName("redirect:/notice/msg.do");
       }

       
       return mav; // forward
     }   
}
