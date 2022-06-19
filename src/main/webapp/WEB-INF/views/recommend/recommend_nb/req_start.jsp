<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>노트북 추천 시스템</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css"> <%-- /static 기준 --%>

    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script type="text/javascript">
      $(function() { // 자동 실행
        $('#btn_forward').on('click', function() { frm.submit(); });
        $('#btn_close').on('click', function() { window.close(); });     // 윈도우 닫기
      });
    </script>
</head>
<body>
<DIV class="container">
    <H2 style="text-align: center;">노트북 추천</H2>

    <DIV style="text-align:center; margin: 50px auto;">
        회원번호를 입력하시면 회원님께 알맞은 노트북을 추천해드립니다.<br><br>
    </DIV>
    <DIV style="text-align:center; margin: 50px auto;"><img id='img1' src="/recommend_nb/images/title.jpg" style='height: 400px'></DIV>
    <FORM id='frm' name='frm' action='/recommend/recommend_nb_req/end.do' method='GET'>
        <DIV style="text-align:center; margin: 50px auto;">
            회원 번호 : <input type='number' name='user_id' id='user_id' min='1' max='100' step='1' value='1' style='width: 5%; text-align: right;'>
            <br><br><br>
            <button type='button' id='btn_forward' class='btn btn-info'>결과 확인하기</button>
            <button type='button' id='btn_close' class='btn btn-info'>취소</button>
        </DIV>
    </FORM>

</DIV>
</body>
</html>

