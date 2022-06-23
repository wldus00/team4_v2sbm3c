<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>챗봇 intent</title>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style type="text/css">
        *{
            margin:0;
            padding:0;
        }
        .container {
            width: 100%;
            margin: 0 auto;
            padding: 10px
        }
        .container h2{
            text-align: left;
            padding: 5px 5px 5px 15px; /* top, right, bottom, left */
            color: #FFBB00;
            border-left: 3px solid #FFBB00;
            margin-bottom: 15px;
        }
        .container p{
            text-align: left;
            padding: 2px 2px 2px 8px; /* top, right, bottom, left */
            color: #FFBB00;
            border-left: 1px solid #FFBB00;
            margin-bottom: 10px;
        }
        .chatting_pannel {
            background-color: #EFEFEF;
            width: 100%;
            height: 400px;
            overflow-y: scroll; /* scrollbar가 자동으로 생김 */
            padding: 5px;
        }
        .chatting_pannel p{
            font-size: 16px;
            border-radius: 10px;
            display: inline-block;
            padding: 2px 5px;
        }
        input {
            width: 60%;
            height: 25px;
        }
        .send_msg{
            text-align: right;
            color: #000000;
            background-color: yellow;
        }
        .receive_msg{
            text-align: left;
            color: #FFFFFF;
            background-color: #7a7373;
        }

        A:link{  /* 방문전 상태 */
            text-decoration: none; /* 밑줄 삭제 */
            color: #555555;
        }

        A:visited{  /* 방문후 상태 */
            text-decoration: none; /* 밑줄 삭제 */
            color: #555555;
        }

        A:hover{  /* A 태그에 마우스가 올라간 상태 */
            text-decoration: underline; /* 밑줄 출력 */
            color: #7777FF;
        }

        A:active{  /* A 태그를 클릭한 상태 */
            text-decoration: underline; /* 밑줄 출력 */
            color: #7777FF;
        }
        #button_cate {
            text-align: center;
            padding: 5px 5px 5px 15px; /* top, right, bottom, left */
            
            margin-bottom: 20px;
        }
</style>
<script type="text/javascript">
$(function() {
    // 키이벤트 처리
    $('#chatting').on('keydown', function(key) {
      if (key.keyCode == 13) { // Enter
        // alert('enter input');
        send();
      }
    });
})
function send() {
    var msg = $("#chatting").val();
    $("#chatting_pannel").append("<div style='text-align: right'><p class='send_msg'>문의: " + msg + "</p></div>");
    $('#chatting').val("");
    // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    var params = 'msg=' + msg;
    // alert('params: ' + params);  
    $.ajax({
        url: 'http://127.0.0.1:8000/chatbot_intent/chatting_query',
        type: 'get',  // get or post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
            // alert(rdata.result);
            var msg = rdata.result;
            if(msg != null && msg.trim() != ''){
                $("#chatting_pannel").append("<p class='receive_msg'>안내 센터: " + msg + "</p><br>");
            }
            $('#panel').html(str);  // document.getElementById('panel').innerHTML=str;
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
        error: function(request, status, error) { // callback 함수
        console.log(error);
        }
    });
    // $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
    // $('#panel').html("<img src='{% static '/images/ani04.gif' %}' style='width: 10%;'>");
    // $('#panel').show(); // 숨겨진 태그의 출력
}
// function receive() {
//     var msg = '감사합니다.';
//     if(msg != null && msg.trim() != ''){
//         $("#chatting_pannel").append("<p class='receive_msg'>안내 센터: " + msg + "</p><br>");
//     }
// }
function clearInput() {
        document.getElementById("chatting").value ='';
    }
  
</script>
</head>
<body>
    <div id="container" class="container">
        <h2>실시간 문의<br></h2>
        <p>게이밍노트북,사무용노트북,
        <br>
        애플노트북,lg노트북,삼성노트북 문의가능합니다<p>
        <div id="chatting_pannel" class="chatting_pannel">
        </div>
        <div style='margin: 0px auto;'>
            메시지 &nbsp&nbsp&nbsp&nbsp
            <input id="chatting" name='chatting' placeholder="보내실 메시지를 입력하세요."
                   value="10일에 게이밍노트북 구매가능한가요?">
            <BR>
            <div id=button_cate>
            <button onclick="send()" id="sendBtn" class="btn btn-info">보내기</button>
            <button onclick="window.close()" class="btn btn-info">닫기</button>
             <button onclick="clearInput()" id="erasebtn" class = "btn btn-info" >내용 지우기</button>
			</div>
        </div>
    </div>
</body>
</html>

