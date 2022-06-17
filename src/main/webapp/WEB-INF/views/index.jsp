<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>노트북 쇼핑몰</title>
<!-- /static 기준 -->
 <!-- <link href="/css/style.css" rel="Stylesheet" type="text/css"> -->
 <link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
    
  <div id="main">
    <%-- /static/images/resort01.jpg --%>
    <img src='./css/images/images.png'>
  </div>


  

    <jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>