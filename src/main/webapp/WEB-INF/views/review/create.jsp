<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>노트북 쇼핑몰</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
   var frm = $('#frm');
   $('#btn_create', frm).on('click', review_create);

// 댓글 등록
   function review_create() {
     var frm = $('#frm');
     
       var params = frm.serialize(); 
       if ($('#content', frm).val().length > 300) {
         $('#modal_title').html('댓글 등록'); // 제목 
         $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
         $('#modal_panel').modal();           // 다이얼로그 출력
         return;  // 실행 종료
       }
    }
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
<DIV class='title_line'>
  <A href="../contents/list_paging.do?nbno=${nbVO.nbno}&now_page=1" class='title_link'>${nbVO.name }</A> > 리뷰 등록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?contentsno=${contentsVO.contentsno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>  
  </ASIDE> 
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
             enctype="multipart/form-data">
    <input type="hidden" name="nbgrpno" value="${nbVO.nbgrpno }"> 
    <input type="hidden" name="nbno" value="${nbVO.nbno }">
    <input type="hidden" name="contentsno" value="${param.contentsno }">
    <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
    
    <div class="form-group" style="width:70%">
       <label class="control-label col-md-2">이미지</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
       </div>
    </div> 
    
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='content' required="required" class="form-control" style='width: 70%; height: 70px'></textarea>
       </div>
    </div> 
      
    <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='1234' required="required" 
                    class="form-control" style='width: 50%;'>
       </div>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" id='btn_create' class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_join.do?contentsno=${contentsVO.contentsno }'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>