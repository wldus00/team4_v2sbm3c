<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>YOUTUBE</title>
 
<link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>유튜브 그룹 > ${YtgrpVO.title } 조회(수정)</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='ytgrpno' id='ytgrpno' value='${YtgrpVO.ytgrpno }'>
        
      <label>그룹 이름</label>
      <input type='text' name='title' value="${YtgrpVO.title }" required="required" 
                 autofocus="autofocus" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='cnt' value="${YtgrpVO.cnt }" required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' ${YtgrpVO.visible == 'Y' ? "selected='selected'":"" }>Y</option>
        <option value='N' ${YtgrpVO.visible == 'N' ? "selected='selected'":""}>N</option>
      </select>
       
      <button type="submit" id='submit'>저장</button>
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
      <TH class="th_bs">등록일</TH>
     
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="YtgrpVO" items="${list}">
      <c:set var="ytgrpno" value="${YtgrpVO.ytgrpno }" />
       <c:set var="visible" value="${YtgrpVO.visible }" />
        <c:set var="title" value="${YtgrpVO.title }" />
      <TR>
        <TD class="td_bs">${YtgrpVO.cnt }</TD>
        <TD class="td_bs_left"><A href="../you/list_by_ytgrpno.do?ytgrpno=${ytgrpno }">${title }</TD>
        <TD class="td_bs">${YtgrpVO.rdate.substring(0, 10) }</TD>
        
      
        <TD class="td_bs">
          <A href="../you/create.do?yougrpno=${yougrpno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          
          <A href="/read_delete.do?ytgrpno=${ytgrpno }" title="삭제"><i class="fa-solid fa-eraser"></i></A>
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