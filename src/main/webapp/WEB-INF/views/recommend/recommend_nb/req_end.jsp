<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>노트북 추천 시스템</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        $(function() {
            $('#btn_previous').on('click', function() { history.back(); });   // 이전
            $('#btn_close').on('click', function() { window.close(); });      // 윈도우 닫기
            $('#btn_reset').on('click', function() { location.href = "/recommend/recommend_nb_req/start.do"; });      // 처음으로 돌아가기
            send();  // Django ajax 호출
        });

        function send() {
            var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
            // alert('params: ' + params);  // 수신 데이터 확인
            $.ajax({
              url: 'http://localhost:8000/recommend_nb_req/end_ajax/',  // Spring Boot -> Django 호출
              type: 'get',  // get or post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 응답이 온경우
            	// alert(rdata.df);
                
                $('#panel').html("");  // animation gif 삭제
                $('#panel').css('display', 'none'); // 숨겨진 태그의 출력
                $('#df').css('display','');
                df = rdata.df

                dfs = df.split('\n');
                df = "";
                
                dfs[0] = "<table class='table table-striped table-bordered'>";
                dfs[2] = "<tr class='table-info' style='text-align : center;'>";
                dfs[3] = "<th>제품 번호</th>";
                dfs[4] = "<th>제품명</th>";
                dfs[5] = "<th>적합도</th>";
                dfs[7] = "";
                dfs[8] = "";
                dfs[9] = "";
                dfs[10] = "";
                dfs[11] = "";

                for(i = 0; i < dfs.length; i++){
                    // alert(dfs[i]);
                    df = df + dfs[i];
                }
                $('#df').html(df);                
                
                // --------------------------------------------------
                // 분류 정보에 따른 상품 이미지 SELECT
                //  --------------------------------------------------
              },
              // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우
              error: function(request, status, error) { // callback 함수
                console.log(error);
              }
            });

            // $('#panel').html('처리중입니다....');  // 텍스트를 출력하는 경우
            $('#panel').html("<img src='/images/ani04.gif' style='width: 10%;'>");
            $('#panel').show(); // 숨겨진 태그의 출력
          }
    </script>

    <style>
        *{
            text-align: center;
        }

        .td_image{
            vertical-align: middle;
            padding: 5px;
            cursor: pointer;
        }
        
        .dataframe{
            margin: 30px auto;
        }

    </style>
    
</head>
<body>
<DIV style='display: none;'>
    <form name='frm' id='frm'>
        <input type='hidden' name='user_id' value='${param.user_id }'>
    </form>
</DIV>

<DIV class="container">
    <H2>회원번호 ${param.user_id }번의 추천 노트북</H2>
    <DIV id='panel' style='margin: 30px auto; width: 90%;'></DIV>
    
    <DIV id='df' style='display: none; margin: 30px auto;'>
    </DIV>
    <br>
    <DIV style="text-align:center;">
        <button type='button' id='btn_previous' class="btn btn-info">이전</button>
        <button type='button' id='btn_close' class="btn btn-info">종료</button>
        <button type='button' id='btn_reset' class="btn btn-info">처음으로</button>
    </DIV>

</DIV>
</body>
</html>

