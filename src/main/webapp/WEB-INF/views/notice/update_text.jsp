<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title" value="${noticeVO.title }" />
<c:set var="content" value="${noticeVO.content }" />

         
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
     
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<div id="main"><br>
<DIV class='title_line'>
  공지사항 > 

  ${title } 수정
</DIV>

<DIV class='content_body'>
   <ASIDE class="aside_right">
      <A href="./create.do">등록</A>
      <span class='menu_divide' >│</span>
      <A href="javascript:location.reload();">새로고침</A>
    </ASIDE> 
  
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type='hidden' name='noticeno' value='${param.noticeno }' >
    
    <div class="form-group">
       <label class="control-label col-md-2">메모제목</label>
       <div class="col-md-10">
         <input type='text' name='title' value='${title }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">메모내용</label>
       <div class="col-md-10">
         <textarea name='content' required="required" class="form-control" rows="20" style='width: 100%;'>${content }</textarea>
       </div>
    </div>

    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
</div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
<script type="text/javascript">
  $(function(){
 
  });
</script>
</body>
 
</html>