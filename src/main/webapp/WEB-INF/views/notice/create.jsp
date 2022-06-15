<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Resort world</title>

<link href="/css/main.css" rel="Stylesheet" type="text/css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css"></head>
    
<script type="text/javascript">
	$(function() {

	});
</script>

</head>

<body>
    <jsp:include page="../menu/top.jsp" flush='false' />
    <div id="main">
    <DIV class='title_line'>공지사항</DIV>

    <DIV class='content_body'>
        <ASIDE class="aside_right">
            <A href="./create.do?noticeno=${noticeVO.noticeno }">등록</A> <span
                class='menu_divide'>│</span> <A
                href="javascript:location.reload();">새로고침</A>
        </ASIDE>

        <DIV style="text-align: right; clear: both;">
            <form name='frm' id='frm' method='get'
                action='./list_by_notice.do'>
                <input type='hidden' name='noticeno'
                    value='${noticeVO.noticeno }'>

            </form>
        </DIV>

        <DIV class='menu_line'></DIV>

        <FORM name='frm' method='POST' action='./create.do'
            class="form-horizontal" enctype="multipart/form-data">


            <div class="form-group">
                <label class="control-label col-md-2">제목</label>
                <div class="col-md-10">
                    <input type='text' name='title' value='입력'
                        required="required" autofocus="autofocus"
                        class="form-control" style='width: 100%;'>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-md-2">메모장</label>
                <div class="col-md-10">
                    <textarea name='content' required="required"
                        class="form-control" rows="12"
                        style='width: 100%;'></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2">메모장</label>
                <div class="col-md-10">
                    <input type='file' class="form-control"
                        name='file1MF' id='file1MF' value=''
                        placeholder="파일 선택">
                </div>
            </div>
            <div class="content_body_bottom">
                <button type="submit" class="btn btn-primary">등록</button>
                <button type="button"
                    onclick="location.href='./list_by_notice.do'"
                    class="btn btn-primary">목록</button>
            </div>

        </FORM>
    </DIV>
</div>
    <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>