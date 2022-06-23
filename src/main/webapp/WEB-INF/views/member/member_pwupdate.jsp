<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    
<script type="text/javascript">
$(function(){
    $('#btn_send').on('click', send); // 변경 버튼
    $('#pw2').on('focusout',pwcheck); // 비밀번호 재확인 버튼
});

function pwcheck(){
    let frm = $('#frm');
    let pw1 = $("#pw", frm).val();
    let pw2 = $("#pw2", frm).val();
    if(pw1 ==""){
        $("#pw").focus();
        $("#modal_pwcheck").html("입력하시오");
        $("#modal_pwcheck").css('color','#FFFFFF');
        $("#modal_pwcheck").css('background-color','#EE0000');
        return;
        }
    if(pw1 != "" || pw2 != ""){
        if(pw1 == pw2){
            // alert('일치');
            $("#modal_pwcheck").html("일치");
            $("#modal_pwcheck").css('color','#FFFFFF');
            $("#modal_pwcheck").css('background-color','#009900');
        } else {
            // alert('불일치');
            $("#modal_pwcheck").html('불일치');
            $("#modal_pwcheck").css('color', '#FFFFFF');
            $("#modal_pwcheck").css('background-color','#EE0000');
            $('#pw').val("");
            $('#pw2').val("");
        }
    }
}

function send() { // 회원 가입 처리

    $('#frm').submit();
    
  }


</script>
</head>

<body>
    <jsp:include page="../menu/top.jsp" flush='false' />
    <div id="main">
    <div class="content_body">
        <table class="table table-striped" style='width: 100%;'>
        <colgroup>
            <col style='width: 20%; border-right: solid #999999;'/>
            <col style='width: 80%;'/>
            <tr valign="middle" height="49px">
                <td><a href="./member_update.do?memberno=${memberno }">정보 수정</a></td>
                <td rowspan="5">
    <DIV style='width: 100%; margin: 10px auto; text-align: center;'>
    </DIV>
    <FORM name='frm' id='frm' method='POST' action='./member_pwupdate.do' class="form-horizontal">
    <div class="form-group">
      <div class="col-md-10">
        <input type="password" class="form-control" name='now_pw' id='now_pw' 
                   value='' style='width: 30%;' placeholder="현재 비밀번호">
        <input type="hidden" id='memberno' name='memberno' value="${memberno }">
      </div>
    </div>
    <div class="form-group">
      <div class="col-md-10">
        <input type="password" class="form-control" name='pw' id='pw' 
                   value='' style='width: 30%;' placeholder="새 비밀번호">
      </div>
    </div>
    <div class="form-group">
      <div class="col-md-10">
        <input type="password" class="form-control" name='pw2' id='pw2' 
                   value='' style='width: 30%;' placeholder="새 비밀번호 확인">
      </div>
    </div>
    <div class="form-group">
        <div class="col-md-10">
        <table style="width: auto;">
            <tr>
                <td id='modal_pwcheck' align="center"></td>
            </tr>
        </table>
        </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">변경</button>
        <button type="button" onclick="history.back()" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>   
  </FORM>
</td>
            </tr>
            <tr height="49px">
                <td  style="vertical-align: middle;"><a href="./member_pwupdate.do?memberno=${memberno }">비밀번호 변경</a></td>
            </tr>
            <tr height="49px"> 
                <td  style="vertical-align: middle;"><a href="#">미정</a></td>
            </tr>
            <tr height="49px">
                <td  style="vertical-align: middle;"><a href="#">미정</a></td>
            </tr>
            <tr style="height: 100%; width: 5px;">
                <td><a href="#">미정</a></td>
            </tr>
        </table>
        
    </div>
    </div>
    <jsp:include page="../menu/bottom.jsp" flush='false' />

</body>
</html>