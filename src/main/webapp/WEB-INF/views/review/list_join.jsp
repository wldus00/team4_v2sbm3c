<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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
    
<script type="text/javascript">
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href='../contents/list_paging.do?nbno=${nbVO.nbno }'>${nbVO.name } 상품 REVIEW</A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?contentsno=${contentsVO.contentsno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <DIV class='menu_line'></DIV>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 5%;"></col>
      <col style="width: 5%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 60%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 5%;"></col>
    </colgroup>
    
    <thead>
        <tr>
          <th style='text-align: center;'>댓글<br>번호</th>
          <th style='text-align: center;'>회원<br> ID</th>
          <th style='text-align: center;'>사진</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
    <tbody>
      <c:forEach var="reviewMemberVO" items="${list }">
         <c:set var="reviewno" value="${reviewMemberVO.reviewno }" />
          <c:set var="contentsno" value="${reviewMemberVO.contentsno }" />
          <c:set var="id" value="${reviewMemberVO.id }" />
          <c:set var="content" value="${reviewMemberVO.content }" />
          <c:set var="rdate" value="${reviewMemberVO.rdate }" />
         <c:set var="thumb1" value="${reviewMemberVO.thumb1 }" />
        
        <tr> 
          <td style='text-align: center; vertical-align: middle;'>
              ${reviewno }
          </td>
          <td style='text-align: center; vertical-align: middle;'>
              ${id}
            </td>
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <IMG src="/review/storage/${thumb1 }" style="width: 120px; height: 80px;">
              </c:when>
              <c:otherwise> <!-- 기본 이미지 출력 -->
                <IMG src="/review/images/none1.png" style="width: 120px; height: 80px;">
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
             ${content}
          </td> 
          <td style='text-align: center; vertical-align: middle;'>
              ${rdate.substring(0, 10)}
          </td>
          
          <td style='text-align: center; vertical-align: middle;'>
              <A href="./delete.do?reviewno=${reviewno}&contentsno=${contentsno}"><img src='/review/images/delete.png' style="width: 30%; height: 30%"></a>
          </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  <br>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>