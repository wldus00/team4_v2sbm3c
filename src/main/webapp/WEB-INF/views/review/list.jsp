<%@ page contentType="text/html; charset=UTF-8"%>
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
 
</head>
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class="title_line">
    등록된 모든 리뷰
  </DIV>
  <ASIDE class='aside_right'>
    <A href='../nbgrp/list.do'>카테고리 그룹</A>
    <span class='menu_divide' >│</span>  
    <A href='./list.do'>모든 리뷰</A>
    <span class='menu_divide' >│</span> 
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
   
  <div class='menu_line'></div>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 70%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 5%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>댓글<br>번호</th>
          <th style='text-align: center;'>글<br>번호</th>
          <th style='text-align: center;'>회원<br>번호</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="reviewVO" items="${list }">
          <c:set var="contentsno" value="${reviewVO.contentsno }" />
          <c:set var="reviewno" value="${reviewVO.reviewno }" />
          
          <tr style='height: 50px;'> 
            <td style='text-align: center; vertical-align: middle;'>
              ${reviewVO.reviewno }
            </td> 
            <td style='text-align: center; vertical-align: middle;'>
              <A href='../contents/read.do?contentsno=${contentsno }'>${contentsno}</A>
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <A href='../member/read.do?memberno=${reviewVO.memberno }'>${reviewVO.memberno}</A>
            </td>
            <td style='text-align: left; vertical-align: middle;'>${reviewVO.content}</td>
            <td style='text-align: center; vertical-align: middle;'>
              ${reviewVO.rdate.substring(0, 10)}
            </td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="./delete.do?reviewno=${reviewVO.reviewno}"><img src="/review/images/delete.png" title="삭제"  border='0' style="width:50%; height: 30px"/></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>