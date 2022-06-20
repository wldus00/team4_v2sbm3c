<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>회원목록</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<div id="main">
  <DIV class='title_line' align="center">
  <form action="./search.do" method="get">
    <select>
        <option value="id">ID</option>
        <option value="username">성명</option>
        <option value="tel">전화번호</option>
        <option value="address1">주소</option>
    </select>
    <input type="text" id="search" name="search">
    <button type="button">검색</button>
  </form>
  </DIV>

  <DIV class='content_body'>

   <!--  <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE>  -->
   
    <!-- <div class='menu_line'></div> -->
    
    
    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>
      <%-- <col style='width: 10%;'/> --%>
    </colgroup>
    <TR>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      <TH class='th_bs'>주소1</TH>
      <TH class='th_bs'>주소2</TH>
      <TH class='th_bs'>등록일</TH>
      <!-- <TH class='th_bs'>기타</TH> -->
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="username" value ="${memberVO.username}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="address2" value ="${memberVO.address2}" />
      <c:set var="signdate" value ="${memberVO.signdate}" />
       
    <TR>
      <TD class='td_left'>${id}</TD>
      <TD class='td_left'>${username}</TD>
      <TD class='td_basic'>${tel}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 25 }"> <!-- 긴 주소 처리 -->
            ${address1.substring(0, 25) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_left'>${address2} </TD>
      <TD class='td_basic'>${signdate.substring(0, 10)}</TD> <!-- 년월일 -->
      <%-- <TD class='td_basic'>
        <A href="./passwd_update.do?memberno=${memberno}"><i class="fa-solid fa-key"></i></A>
        <A href="./read.do?memberno=${memberno}"><i class="fa-solid fa-file-pen"></i></A>
        <A href="./delete.do?memberno=${memberno}"><i class="fa-solid fa-trash-can"></i></A>
      </TD> --%>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.reload();" class="btn btn-info">새로 고침</button>
  </DIV>
</DIV>
 </div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>