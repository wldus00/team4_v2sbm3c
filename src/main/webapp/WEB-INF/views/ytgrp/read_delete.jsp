<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/main.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹 > ${ytgrpVO.title } 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='ytgrpno' id='ytgrpno' value='${ytgrpVO.ytgrpno }'>
        
      <label>그룹 이름</label>: ${ytgrpVO.title}  
      <label>순서</label>: ${ytgrpVO.cnt }   
      <label>출력 형식</label>: ${ytgrpVO.visible }  
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
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
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">대분류명</TH>
      <TH class="th_bs">조회수</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="YtgrpVO" items="${list}">
      <c:set var="ytgrpno" value="${ytgrpVO.ytgrpno }" />
      <c:set var="visible" value="${ytgrpVO.visible }" />
       <c:set var="title" value="${YtgrpVO.title }" />
            
      <TR>
      	<td class="td_bs">${ytgrpVO.ytgrpno }</td>
        <TD class="td_bs"><A href="../you/list_by_ytgrpno.do?ytgrpno=${ytgrpno }">${title }</TD>
        <TD class="td_bs_left">${ytgrpVO.cnt}</TD>
        <TD class="td_bs">${ytgrpVO.rdate.substring(0, 10) }</TD>
        
        <TD class="td_bs">
          <A href="../you/create.do?yougrpno=${yougrpno }" title="${title } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          <A href="./read_update.do?ytgrpno=${ytgrpno }" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
         
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

