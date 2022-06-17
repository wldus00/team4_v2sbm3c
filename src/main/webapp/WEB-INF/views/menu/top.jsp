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
                        </c:when>
                     <c:otherwise>
                            <a href='/member/logout.do'>${sessionScope.id } 로그아웃</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li><a href="/member/create.do">회원가입</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="/cart/list_by_memberno.do">장바구니</a></li>
                <li><a href="/order_pay/create.do">주문 결제</a></li>
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
                    <img src="/css/images/images.png" alt="노트북 사진" />
                    <a class="title_a">노트북 추천 쇼핑몰</a>
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
                    즐겨찾기
                </button>
                <div class="dropdown-content">
                    <a href="#">즐겨찾기 그룹</a>
                    <a href="#">즐겨찾기 전체</a>
                    <a href="#">즐겨찾기 전체 Join</a>
                </div>
                </div>
            <div class="dropdown">
                <button class="dropbtn">
                    추천시스템
                </button>
                </div>
                <div class="dropdown">
                <button class="dropbtn"> 
                    Youtube
                </button>
                  <div class="dropdown-content">
                    <a href="#">Youtube 목록</a>
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
        </div>

    </header>
  