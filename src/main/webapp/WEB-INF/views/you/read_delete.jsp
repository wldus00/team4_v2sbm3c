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
 
<DIV class='title_line'>
  <A href="../yougrp/list.do" class='title_link'>카테고리 그룹</A> > 
  <A href="./list_by_ytgrpno.do?ytgrpno=${param.ytgrpno }" class='title_link'>${ytgrpVO.title }</A> > 
  ${cateVO.name } 수정 
</DIV>

<DIV class='content_body'>

  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='youno' id='youno' value="${youVO.youno }">
      
      <label>그룹 번호</label>: ${youVO.ytgrpno }  
      <label>카테고리</label>: ${youVO.title}  
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list_by_ytgrpno.do?ytgrpno=${youVO.ytgrpno}'">취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리<br> 번호</TH>
      <TH class="th_bs">카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련<br> 자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="YouVO" items="${list}">
      <c:set var="youno" value="${YouVO.youno }" />
      <c:set var="ytgrpno" value="${YouVO.ytgrpno }" />
      <c:set var="title" value="${YouVO.title }" />
      <c:set var="rdate" value="${YouVO.rdate.substring(0, 10) }" />
      <c:set var="url" value="${YouVO.url }" />
      <TR>
        <TD class="td_bs">${youno }</TD>
        <TD class="td_bs">${ytgrpno }</TD>
        <TD class="td_bs_left">${title }</TD>
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">${url }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?youno=${youno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?youno=${youno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>