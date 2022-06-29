<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 <div id="main"><br>
<DIV class='title_line'>유튜브 그룹 > ${param.title }</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 35%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
 <TR>
      <TH class="th_bs">YOU카테고리<br> 번호</TH>
      <TH class="th_bs">YOU카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">YOU카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">url</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="YouVO"  items="${list}">
      <c:set var="youno" value="${YouVO.youno }" />
      <c:set var="ytgrpno" value="${YouVO.ytgrpno }" />
      <c:set var="title" value="${YouVO.title }" />
      <c:set var="rdate" value="${YouVO.rdate.substring(0, 10) }" />
      <c:set var="url" value="${YouVO.url }" />
      
      <TR>
        <TD class="td_bs">${youno }</TD>
        <TD class="td_bs">${ytgrpno }</TD>
        <TD class="td_bs_left">${title}</TD>
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">${url }</TD>
        <TD class="td_bs">
        <A href="../you/create.do?ytgrpno=${ytgrpno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
        <A href="./read_update.do?ytgrpno=${ytgrpno }" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
        <A href="./read_delete.do?youno=${youno }" title="삭제"><i class="fa-solid fa-eraser"></i></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
</div>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>
 