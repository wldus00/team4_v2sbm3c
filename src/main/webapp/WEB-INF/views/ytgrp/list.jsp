<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
mvc.urlgrp.UrlgrpVO" %>
 
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
 <br>
<DIV class='title_line'>유튜브 대그룹 </DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>그룹 이름</label>
      <input type='text' name='title' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <label>출력순서</label>
      <input type='number' name='cnt' value='0' required="required" 
                min='0' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit' class='btn'>등록</button>
      <button type="button" onclick="cancel();" class='btn'>취소</button>
    </FORM>
  </DIV>
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
          
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">출력 순서</TH>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">그룹 생성일</TH>
    
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<CategrpVO> list = (List<CategrpVO>)(request.getAttribute("list"));
    // for (CategrpVO categrpVO: list) {
    //    out.println(categrpVO.getName() + "<br>");
    // }
    %>
    <c:forEach var="YtgrpVO" items="${list}">
      <c:set var="ytgrpno" value="${YtgrpVO.ytgrpno }" />
      <c:set var="title" value="${YtgrpVO.title }" />
      <c:set var="visible" value="${YtgrpVO.visible }" />
      
      <TR>
        <TD class="td_bs">${YtgrpVO.ytgrpno }</TD>
        <TD class="td_bs_left"><A href="../you/list_by_ytgrpno.do?ytgrpno=${ytgrpno }">${title }</TD>
        <TD class="td_bs">${YtgrpVO.rdate.substring(0, 10) }</TD>
      
        
          
        <TD class="td_bs">
          <A href="../you/create.do?ytgrpno=${ytgrpno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          <A href="./read_update.do?ytgrpno=${ytgrpno }" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
          <A href="./read_delete.do?ytgrpno=${ytgrpno }" title="삭제"><i class="fa-solid fa-eraser"></i></A>
          <A href="./update_seqno_up.do?yougrpno=${yougrpno }" title="우선순위 상향"><i class="fa-solid fa-angle-up"></i></A>
          <A href="./update_seqno_down.do?yougrpno=${yougrpno }" title="우선순위 하향"><i class="fa-solid fa-angle-down"></i></A>         
          ${categrpno }
        </TD>    
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>