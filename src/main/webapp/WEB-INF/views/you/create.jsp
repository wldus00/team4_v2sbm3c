<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>유튜브 등록</DIV>

<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <!-- 
    부모테이블 categrpno PK 컬럼 값 이용, FK 선언
    http://localhost:9091/cate/create.do
    http://localhost:9091/cate/create.do?categrpno=1
     -->
    <input type="hidden" name="ytgrpno" value="${param.ytgrpno }"> 
    
    <div class="form-group">
       <label class="control-label col-md-3">유튜브이름</label>
       <div class="col-md-9">
         <input type='text' name='title' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 50%;'>
          (유튜브 타이틀: ${param.ytgrpno })         
       </div>
        <label class="control-label col-md-3">url 주소</label>
        <div class="col-md-9">
         <input type='text' name='url' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 50%;'>
                  
       </div>
    </div>
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_by_yougrp.do'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>