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
            $('#btn_reset').on('click', function() { location.href = "/recommend/recommend_naivebayes/start.do"; });  // 처음으로 돌아가기
          
            send();  // Django ajax 호출
        });

        function send() {
            var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
            // alert('params: ' + params);  // 수신 데이터 확인
            $.ajax({
              url: 'http://localhost:8000/recommend_naivebayes/end/',  // Spring Boot -> Django 호출
              type: 'get',  // get or post
              cache: false, // 응답 결과 임시 저장 취소
              async: true,  // true: 비동기 통신
              dataType: 'json', // 응답 형식: json, html, xml...
              data: params,      // 데이터
              success: function(rdata) { // 응답이 온경우
            	// alert(rdata.index);
                
            	  if (rdata.index == 0) {
                      $('#ah').css('display',''); // show
                  } else if(rdata.index == 1) {
                      $('#al').css('display','');
                  } else if(rdata.index == 2) {
                      $('#wg').css('display','');
                  } else if(rdata.index == 3) {
                      $('#wh').css('display','');
                  }  else {
                      $('#wl').css('display','');
                  } 
                  
                
                $('#panel').html("");  // animation gif 삭제
                $('#panel').css('display', 'none'); // 숨겨진 태그의 출력
                             
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
        <input type='hidden' name='send_user' value='${param.send_user }'>
    </form>
</DIV>

<DIV class="container">
    <H2>회원님께 추천 드리는 카테고리</H2>
    <DIV id='panel' style='margin: 30px auto; width: 90%;'></DIV>
    
    <DIV id='panel' style='margin: 30px auto; width: 90%;'></DIV>
    
    <DIV id='panel_img' style='margin: 0px auto; width: 90%;'>
        <DIV id='ah' style='display: none;'> <!-- 1 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_nb/images/v11.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_nb/images/v21.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v31.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v41.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v51.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>        
            </TABLE>
            <BR>
            <H3>고성능 맥북을 추천합니다.</H3>
        </DIV>
        <DIV id='al' style='display: none;'>  <!-- 2 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_nb/images/v12.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_nb/images/v22.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v32.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v42.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v52.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
            <BR>
            <H3>사무용 맥북을 추천합니다.</H3>
        </DIV>
        <DIV id='wg' style='display: none;'> <!-- 3 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_nb/images/v13.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_nb/images/v23.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v33.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v43.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v53.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
            <BR>
            <H3>GPU를 탑제한 게이밍 노트북을 추천합니다.</H3>
        </DIV>
        <DIV id='wh' style='display: none;'> <!-- 4 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img1' src="/recommend_nb/images/v14.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img2' src="/recommend_nb/images/v24.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v34.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v44.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v54.jpg" style='float:left; height: 200px'>
                    </TD>
                </TR>          
            </TABLE>
            <BR>
            <H3>고성능 노트북을 추천합니다.</H3>
        </DIV>
        <DIV id='wl' style='display: none;'> <!-- 5 -->
            <TABLE style='margin: 0px auto;'>
                <TR>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v15.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v25.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v35.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v45.jpg" style='float:left; height: 200px'>
                    </TD>
                    <TD class='td_image'>
                        <img id='img3' src="/recommend_nb/images/v55.jpg" style='float:left; height: 200px'>
                    </TD>                    
                </TR>          
            </TABLE>
            <BR>
            <H3>사무용 노트북을 추천합니다.</H3>
        </DIV>
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

