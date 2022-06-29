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
<DIV class='title_line'><A href="../categrp/list.do" class='title_link'>카테고리 그룹</A> > ${categrpVO.name }</DIV>

<DIV class='content_body'>

  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>유튜브제목</label>
      <input type='text' name='ytgrpno' value='${param.ytgrpno }' > 
    
      <label>url</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;' autofocus="autofocus">
  
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
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
      <TH class="th_bs">YOU카테고리<br> 번호</TH>
      <TH class="th_bs">YOU카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">YOU카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">url</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="YouVO" items="${list}">
      <c:set var="youno" value="${YouVO.youno }" />
      <TR>
        <TD class="td_bs">${YouVO.youno }</TD>
        <TD class="td_bs">${YouVO.ytgrpno }</TD>
        <TD class="td_bs">${YouVO.title }</TD>
        <TD class="td_bs">${YouVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">${YouVO.url }</TD>
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