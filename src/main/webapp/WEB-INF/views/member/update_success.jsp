<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
<!-- /static 기준 -->
 <!-- <link href="/css/style.css" rel="Stylesheet" type="text/css"> -->
 <link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>

<script type="text/javascript">
  $(function(){ 
    $('#btn_home').on('click', function() {  // click 이벤트와 함께 처리 함수를 동시 등록
      location.href="/index.do";
    });
  });
</script>

</head>
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
<br>
  <DIV class='message' align="center">
    <fieldset class='fieldset_basic'>
      <ul >
        <li class='li_none'>회원정보 변경 성공<br><br></li>
        <li class='li_none'>
          <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>