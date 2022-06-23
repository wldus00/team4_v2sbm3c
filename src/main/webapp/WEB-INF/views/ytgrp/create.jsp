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
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>즐겨찾기 그룹  > 등록</DIV>
 
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <div class="form-group">
       <label class="control-label col-md-4">유뷰브 그룹 이름</label>
       <div class="col-md-8">
         <input type='text' name='title' value='' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-4">출력 순서</label>
       <div class="col-md-8">
         <input type='number' name='cnt' value='0' required="required" 
                   placeholder="조회수" min="0" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-4">출력 형식</label>
       <div class="col-md-8">
          <select name='visible' class="form-control" style='width: 20%;'>
            <option value='Y' selected="selected">Y</option>
            <option value='N'>N</option>
          </select>
       </div>
    </div>   
  
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 