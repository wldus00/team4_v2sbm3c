<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>노트북 쇼핑몰</title>
<%-- /static/css/style.css --%> 
 <link href="/css/main.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<div id="main">
<DIV class='title_line'>카테고리 > 알림</DIV>
<%-- code: ${code } / cnt: ${cnt } --%>
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 카테고리 [${param.name }] 등록했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 카테고리 [${param.name }] 등록에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'update_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">카테고리 [${param.name }] 수정에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${param.code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">[${param.name }] 카테고리 삭제에 성공했습니다.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${param.code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">[${param.name }] 카테고리 삭제에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${param.cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn btn-danger">다시 시도</button>    
            </c:when>
            <c:when test="${param.cnt > 0 }">
                <button type='button' onclick="location.href='./create.do?nbgrpno=${param.nbgrpno}'" class="btn btn-info">새로운 카테고리 등록</button>    
            </c:when>
        </c:choose>
        
        <button type='button' onclick="location.href='./list_all.do'" class="btn btn-info">카테고리 전체 목록</button>
        <button type='button' onclick="location.href='./list_by_nbgrpno.do?nbgrpno=${param.nbgrpno}'" class="btn btn-info">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>
</div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>