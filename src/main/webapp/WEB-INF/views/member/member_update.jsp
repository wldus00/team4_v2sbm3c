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
    $('#btn_DaumPostcode').on('click', DaumPostcode); // 다음 우편 번호
    $('#btn_send').on('click', send); // 가입 버튼
});


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
                <td rowspan="5" align="center">
    <DIV style='width: 100%; margin: 10px auto; text-align: center;'>
    </DIV>
    <FORM name='frm' id='frm' method='POST' action='./update.do' class="form-horizontal">
    <div class="form-group">
      <label for="pw" class="col-md-2 control-label" style='font-size: 0.9em;'>PW</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='pw' id='pw' 
                   value='' style='width: 30%;' placeholder="비밀번호">
      </div>
    </div>
    <div class="form-group">
      <label for="username" class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>    
      <div class="col-md-10">
      <label for="username" class="col-md-2 control-label" style='font-size: 0.9em;'>${memberVO.username}</label>    
      <br><input type="hidden" name="memberno" id="memberno" value="${memberVO.memberno}">
      </div>
    </div>
         <div class="form-group">
      <label for="zipcode" class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='zipcode' id='zipcode' 
                   value='${memberVO.zipcode }' style='width: 30%;' placeholder="우편번호">
        <button type="button" id="btn_DaumPostcode" class="btn btn-info btn-md" style="margin-top: 5px;">우편번호 찾기</button>
      </div>
    </div>  
<DIV>
                                            <!-- 우편번호 API 시작 -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1; width: 20px; height: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
// 우편번호 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function DaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 기본 주소가 도로명 타입일때 조합한다.
            if(data.addressType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#zipcode').val(data.zonecode); // 5자리 새우편번호 사용 ★
            $('#address1').val(fullAddr);  // 주소 ★

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
            
            $('#address2').focus(); //  ★
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}
</script>

     </div>
    <div class="form-group">
      <label for="address1" class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='address1' id='address1' 
                   value='${memberVO.address1 }' style='width: 30%;' placeholder="주소">
      </div>
    </div>
    <div class="form-group">
      <label for="address2" class="col-md-2 control-label" style='font-size: 0.9em;'>상세주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='address2' id='address2' 
                   value='${memberVO.address2 }' style='width: 30%;' placeholder="상세주소">
      </div>
    </div>
        <div class="form-group">
      <label for="gender" class="col-md-2 control-label" style='font-size: 0.9em;'>성별</label>    
      <div class="col-md-10">
        ${memberVO.gender }
      </div>
    </div>
    <div class="form-group">
      <label for="birth" class="col-md-2 control-label" style='font-size: 0.9em;'>생년월일</label>    
      <div class="col-md-10">
        <fmt:parseDate value="${memberVO.birth}" var="dateValue" pattern="yyyy-MM-dd 00:00:00"/>
        <fmt:formatDate pattern="yyyy-MM-dd" value="${dateValue}"/>
      </div>
    </div> 
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='tel' id='tel' 
                   value='${memberVO.tel }' style='width: 30%;' placeholder="010-0000-0000">
      </div>
    </div> 
    
    
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">수정</button>
        <button type="button" onclick="history.back()" class="btn btn-primary btn-md">취소</button>

      </div>
    </div>   
  </FORM>
</td>
            </tr>
            <tr height="49px">
                <td  style="vertical-align: middle;"><a href="#">게시글 관리</a></td>
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