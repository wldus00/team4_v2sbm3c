<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>마이페이지</title>
<!-- /static 기준 -->
<link href="/css/main.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">

<script type="text/javascript">
    
</script>
</head>

<body>
    <jsp:include page="../menu/top.jsp" flush='false' />
    <div id="main">
    <div class="content_body">
        <table class="table table-striped" style='width: 100%;'>
        <colgroup>
            <col style='width: 20%;  border-right: solid #999999;'/>
            <col style='width: 80%;'/>
            <tr valign="middle">
                <td><a href="./member_update.do?memberno=${memberno }">정보 수정</a></td>
                <td rowspan="5"></td>
            </tr>
            <tr>
                <td><a href="#">게시글 관리</a></td>
            </tr>
            <tr>
                <td><a href="#">미정</a></td>
            </tr>
            <tr>
                <td><a href="#">미정</a></td>
            </tr>
            <tr style="height: 500px">
                <td><a href="#">미정</a></td>
            </tr>
        </table>
        
    </div>
    </div>
    <jsp:include page="../menu/bottom.jsp" flush='false' />

</body>
</html>