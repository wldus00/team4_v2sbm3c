<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="noticeno" value="${noticeVO.noticeno }" />
<c:set var="title" value="${noticeVO.title }" />        

<c:set var="file1" value="${noticeVO.file1 }" />
<c:set var="file1saved" value="${noticeVO.file1saved }" />
<c:set var="thumb1" value="${noticeVO.thumb1 }" />
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
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<div id="main"><br>
<DIV class='title_line'>
 메모장 
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?noticeno=${noticeVO.noticeno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A> 
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?noticeno=${noticeno}">수정</A>
    <span class='menu_divide' >│</span>
        <A href="./update_file.do?noticeno=${noticeno}">파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?noticeno=${noticeno}">삭제</A>
  </ASIDE><br>
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <div class="notice_title_img">
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <img src="/contents/storage/${file1saved }"> 
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <img src="/contents/images/none1.png"> 
              </c:otherwise>
            </c:choose>
        </div>
        <div class="notice_title">
          <span style="font-size: 1.5em; font-weight: bold;">${title }</span><br>
        </DIV> 

        <DIV>${content }</DIV>
      </li>
      <li class="li_none">

      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${noticeVO.file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/contents/storage&filename=${noticeVO.file1saved}&downname=${noticeVO.file1}'>${noticeVO.file1}</A> (${noticeVO.size1_label})  
          </c:if>
        </DIV>
      </li> 
    </ul>
  </fieldset>

</DIV>
 </div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>