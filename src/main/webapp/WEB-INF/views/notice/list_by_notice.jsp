<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지사항 게시판</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
     
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
<div id="main">
<DIV class='title_line'>
  공지사항
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <c:choose>
      <c:when test="${sessionScope.grade < 10}">
        <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
      </c:when>
      <c:otherwise>
        <A href="javascript:admin();">등록</A>   
      </c:otherwise>
    </c:choose>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 40%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 5%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
     <thead>
      <tr>
        <th style='text-align: center;'>이미지</th>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>글</th>
        <th style='text-align: center;'>등록일</th>
        <th style='text-align: center;'>조회수</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    
    </thead> 
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="noticeVO" items="${list }">
        <c:set var="noticeno" value="${noticeVO.noticeno }" />
        <c:set var="thumb1" value="${noticeVO.thumb1 }" />
        
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <a href="./read.do?noticeno=${noticeno}"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/contents/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="./read.do?noticeno=${noticeno}"><strong>${noticeVO.title}</strong></a> 
          </td> 
          <td style='vertical-align: middle;'>
            <a href="./read.do?noticeno=${noticeno}">${noticeVO.content}</a>
          </td>
          <td style='vertical-align: middle;'>
            ${noticeVO.rdate}
          </td>
          <td style='vertical-align: middle;'>
            <strong>${noticeVO.notice_cnt}</strong>
          </td>
          <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
              <c:when test="${sessionScope.grade < 10}">
            <A href="./update_text.do?noticeno=${noticeno }" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
            <A href="./delete.do?noticeno=${noticeno }" title="삭제"><i class="fa-solid fa-eraser"></i></A>
            </c:when>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
</DIV>
</div>
 
<jsp:include page="../menu/bottom.jsp" />
<script type="text/javascript">
function admin() {
    alert("관리자만 등록가능합니다.");
}

</script>
</body>
 
</html>