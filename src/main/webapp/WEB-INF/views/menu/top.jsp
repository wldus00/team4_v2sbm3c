<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 헤더 -->
    <header id="header">
        <div class="header_top">
                <a href="http://localhost:9091/index.do">노트북 쇼핑몰</a>
            <ul class="top_menu">
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.id == null}">
                            <a href="/member/login.do">로그인</a>
                            <a href="/member/create.do">회원가입</a>
                        </c:when>
                        <c:otherwise>
                            <a href='/member/logout.do'>${sessionScope.id } 로그아웃</a>
                            <a href="/member/member_update.do?memberno=${memberno }">마이페이지</a>
                            <a href="/cart/list_by_memberno.do">장바구니</a>
                            <a href="/order_pay/create.do">주문 결제</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <c:choose>
                  <c:when test="${sessionScope.grade < 10}">
                    <li class="nav-item dropdown">
                      <a href="/member/list.do">관리자</a>
                    </li>
                  </c:when>
                </c:choose>
            </ul>
        </div>
        <div class="header_title">
            <div class="header_title_cont">
                <div class="title_logo">
                    <img src="/css/images/logo2.jpg" alt="노트북 사진" />
                </div>
                <div class="title_text">
                    <a>노트북 추천 쇼핑몰</a>
                </div>    
            </div>
        </div>
        <div class="gnb">
            <div class="dropdown">
                <button class="dropbtn"> 
                    상품
                </button>
                <div class="dropdown-content">
                    <a href="/nbgrp/list.do">카테고리 그룹</a>
                    <a href="/nb/list_all.do">카테고리 전체 목록</a>
                </div>
            </div>

            <div class="dropdown">
                <button class="dropbtn">
                    관심 분야
                </button>
                <div class="dropdown-content">
                    <a href="#" onclick="javascript:openPopup();">추천시스템</a>
                </div>
                </div>
                <div class="dropdown">
                <button class="dropbtn"> 
                    Youtube
                </button>
                  <div class="dropdown-content">
                    <a href="/you/list_all.do">Youtube 목록</a>
                  </div>
              </div>
            <div class="dropdown">
                <button class="dropbtn">
                    공지사항
                </button>
                  <div class="dropdown-content">
                    <a href="/notice/list_by_notice.do">공지사항</a>
                  </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">
                    장바구니
                </button>
                   <div class="dropdown-content">
                        <a href="/cart/list_by_memberno.do">주문 목록</a>
                        <a href="/order_pay/create.do">주문 결제</a>
                        <a href="/order_pay/list_by_memberno.do">주문 결제 목록</a>
                    </div>
            </div>
             <div class="dropdown">
                <button class="dropbtn">
                    챗봇
                </button>
                  <div class="dropdown-content">
                    <a href="javascript: chatting_intent()">챗봇</a>
                  </div>
            </div>
            
        </div>
      <script type="text/javascript">
      function openPopup() {
          let _width = '800';
          let _height = '500';

          var _left = Math.ceil(( window.screen.width - _width )/2);
          var _top = Math.ceil(( window.screen.height - _height )/2); 
          window.open('/recommend/recommend_nb/start.do', '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
          return false;
        }
      function chatting_intent(){
          var url = './chatbot/chatting_intent.do/';  // URL: path('chatbot_intent/chatting/', views.chatting_intent),  # chatting.html
          var win = window.open(url, '챗봇 intent', 'width=700px, height=630px');

          var x = (screen.width - 700) / 2;
          var y = (screen.height - 630) / 2;

          win.moveTo(x, y); // 화면 중앙으로 이동
        }
      </script>
	
    
    </header>
  