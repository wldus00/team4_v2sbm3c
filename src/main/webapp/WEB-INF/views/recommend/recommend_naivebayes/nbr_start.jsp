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
          
          $('#btn_forward').on('click', getCheckValue );
          $('#btn_close').on('click', function() { window.close(); });     // 윈도우 닫기
      });

      function getCheckValue() {
    	  let send_user = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
          
    	  const query = 'input[name="check_user"]:checked';
    	  const selectedEls = 
    	      document.querySelectorAll(query);
    	  
    	  // 선택된 목록에서 value 찾기
    	  selectedEls.forEach((el) => {
    	    send_user[el.value] = 1;
    	  });
          
          $('#send_user').val(send_user);
          
          // alert(send_user);
          
          if ($('#send_user').val() == null || $('#send_user').val() == ""){
              alert('값을 체크해주세요.');
          } else {
              frm.submit();
          }
          
      }   
      
     </script>
     
     <style type="text/css">
        label{
            display: inline-block;
            width: 220px;
            line-height: 50px;
            margin-right: 30px;
            margin-top : 10px;
            font-weight: bold;
            border : thick dotted #E9E9E9;
        }
        input[type=checkbox]{
            margin-left : 10px;
            margin-right : 10px;
        }
     </style>
</head>
<body>
<DIV class="container" style="margin-top: 60px;">
    <H2 style="text-align: center;">노트북 추천</H2>

    <DIV style="text-align:center; margin: 0px auto;">
        아래 항목중 관심있는 항목을 클릭해주세요.<br><br>
    </DIV>
    <DIV style="text-align:center; margin: 30px auto;"><img id='img1' src="/recommend_nb/images/title.jpg" style='height: 400px'></DIV>
    <FORM id='frm' name='frm' action='/recommend/recommend_naivebayes/end.do' method='GET'>
        <input type='hidden' name='send_user' id='send_user' value=''>
    </FORM>
    
        <TABLE style='margin: 0px auto; margin-left: -40px;'>
            
            <TR>
                <TD class='td_radio' >
                    <label for='step1'><input type='checkbox' name='check_user' id='step1' value='0' class='td_radio_select'>iOS</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step2'><input type='checkbox' name='check_user' id='step2' value='1' class='td_radio_select'>WINDOWS</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step3'><input type='checkbox' name='check_user' id='step3' value='2' class='td_radio_select'>고성능 CPU</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step4'><input type='checkbox' name='check_user' id='step4' value='3' class='td_radio_select'>고성능 GPU</label>
                </TD>
                            <TD class='td_radio'>
                    <label for='step5'><input type='checkbox' name='check_user' id='step5' value='4' class='td_radio_select'>RAM의 용량이 16GB이상</label>
                </TD>
            </TR>
            <TR>
                <TD class='td_radio'>
                    <label for='step6'><input type='checkbox' name='check_user' id='step6' value='5' class='td_radio_select'>감성적인 노트북 디자인</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step7'><input type='checkbox' name='check_user' id='step7' value='6' class='td_radio_select'>지문인식, 얼굴인식등의 생체인식</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step8'><input type='checkbox' name='check_user' id='step8' value='7' class='td_radio_select'>최신형 맥북</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step9'><input type='checkbox' name='check_user' id='step9' value='8' class='td_radio_select'>사무용 맥북</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step10'><input type='checkbox' name='check_user' id='step10' value='9' class='td_radio_select'>게이밍 PC를 원한다.</label>
                </TD>
            </TR>
            <TR>
                <TD class='td_radio'>
                    <label for='step11'><input type='checkbox' name='check_user' id='step11' value='10' class='td_radio_select'>최신형 WINDOWS 노트북</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step12'><input type='checkbox' name='check_user' id='step12' value='11' class='td_radio_select'>사무용 WINDOWS 노트북</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step13'><input type='checkbox' name='check_user' id='step13' value='12' class='td_radio_select'>IOS에서 최신형 기술을 사용하고 싶다.</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step14'><input type='checkbox' name='check_user' id='step14' value='13' class='td_radio_select'>IOS를 입문해보고 싶다.</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step15'><input type='checkbox' name='check_user' id='step15' value='14' class='td_radio_select'>고성능 PC에서 3D 그래픽 작업이 필요하다.</label>
                </TD>
            </TR>
            <TR>
                <TD class='td_radio'>
                    <label for='step16'><input type='checkbox' name='check_user' id='step16' value='15' class='td_radio_select'>다양한 기능이 있는 WINDOWS PC를 원한다.</label>
                </TD>
                <TD class='td_radio'>
                    <label for='step17'><input type='checkbox' name='check_user' id='step17' value='16' class='td_radio_select'>가성비 WINDOWS 노트북이 필요하다. </label>
                </TD>
            </TR>
                         
        </TABLE>


        <DIV style="text-align:center; margin: 50px auto;">
            <button type='button' id='btn_forward' class='btn btn-info'>결과 확인하기</button>
            <button type='button' id='btn_close' class='btn btn-info'>취소</button>
        </DIV>
    
</DIV>
</body>
</html>

