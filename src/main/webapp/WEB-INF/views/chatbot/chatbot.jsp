<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 

    <title>http://127.0.0.1:8000</title>
    {% load static %}
    <link href="/css/main.css" rel="Stylesheet" type="text/css">

    <script type="text/javascript">
        window.onload = function() {

        }

        /* function country(){
          var url = './country_form/';
          var win = window.open(url, 'AI 서비스', 'width=800px, height=660px');

          var x = (screen.width - 800) / 2;
          var y = (screen.height - 660) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function wine(){
          var url = './wine_form/';
          var win = window.open(url, 'AI 서비스', 'width=800px, height=560px');

          var x = (screen.width - 800) / 2;
          var y = (screen.height - 560) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function iris(){
          var url = './iris_form/';
          var win = window.open(url, 'AI 서비스', 'width=800px, height=750px');

          var x = (screen.width - 800) / 2;
          var y = (screen.height - 750) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function actor(){
          var url = './actor_form/';
          var win = window.open(url, 'AI 서비스', 'width=700px, height=500px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 500) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function actor2(){
          var url = './actor_form2/';
          var win = window.open(url, 'AI 서비스', 'width=700px, height=750px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 750) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function recommend_book(){
          var url = './recommend_book/start/';
          var win = window.open(url, 'AI 서비스', 'width=800px, height=600px');

          var x = (screen.width - 800) / 2;
          var y = (screen.height - 600) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function recommend_movie(user_id){
          // var url = 'http://localhost:8000/recommend_movie/req/' + user_id;
          var url = './recommend_movie/req/' + user_id;
          var win = window.open(url, 'AI 서비스', 'width=800px, height=600px');

          var x = (screen.width - 800) / 2;
          var y = (screen.height - 600) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function chat_test(){
          var url = './chatbot/chat_test/';
          var win = window.open(url, '챗봇 테스트', 'width=700px, height=630px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 630) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }
 */
        function chatting(){
          var url = './chatbot/chatting/';
          var win = window.open(url, '챗봇', 'width=700px, height=630px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 630) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }

        function chatting_intent(){
          var url = './chatting_intent.do/';  // URL: path('chatbot_intent/chatting/', views.chatting_intent),  # chatting.html
          var win = window.open(url, '챗봇 intent', 'width=700px, height=630px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 630) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }
</script>


</head>
<body>
<DIV class="container" style="margin: 50px auto; width: 80%;">
<DIV style="text-align: center; font-size: 28px;">노트북 쇼핑몰</DIV>
<H2 style="text-align: center;">노트북 쇼핑몰 챗봇</H2>
<UL style="margin-left: 50px;">

  <LI style="list-style:none">
      <br>
      <OL style="padding-left: 150px;">
<!--          <LI style="line-height: 35px;"><A href="./country_form/">귀농귀촌 적응 예측 시스템(이항분류)</A></LI>-->
<!--          <LI style="line-height: 35px;"><A href="./wine_form/">Red, White 와인 구분하기(이항분류)</A></LI>-->
<!--          <LI style="line-height: 35px;"><A href="./iris_form/">아이리스(붓꽃) 품종 예측(다중분류)</A></LI>-->

    <!--       <LI style="line-height: 35px;"><A href="javascript: country()">귀농귀촌 적응 예측 시스템(이항분류)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: wine()">Red, White 와인 구분하기(이항분류)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: iris()">아이리스(붓꽃) 품종 예측(다중분류)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: actor()">이미지 인식을 통한 영화배우 정보 조회하기(다중분류)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: actor2()">Actor Finder(다중분류)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: recommend_book()">사용자의 관심 분야 파악(추천 시스템)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: recommend_movie(1)">MF(행렬 요인화) 기반 추천 시스템</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: chat_test()">챗봇(테스트)</A></LI>
          <LI style="line-height: 35px;"><A href="javascript: chatting()">챗봇</A></LI> -->
          <LI style="line-height: 35px;"><A href="javascript: chatting_intent()">챗봇 intent</A></LI>
      </OL>

  </LI>
</UL>
</DIV>
</body>
</html>

