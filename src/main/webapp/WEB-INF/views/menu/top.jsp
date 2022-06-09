<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
    <!-- 헤더 -->
    <div class="header">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="/">노트북 쇼핑몰</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
                <span class="navbar-toggler-icon"></span>
            </button>    
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">상품</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href='/nbgrp/list.do'>카테고리 그룹</a>
                            <a class="dropdown-item" href='/nb/list_all.do'>카테고리 전체</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">즐겨찾기</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href=''>즐겨찾기</a>
                            <a class="dropdown-item" href=''>즐겨찾기 전체</a>
                            <a class="dropdown-item"  href=''>즐겨찾기 전체 Join</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">회원</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/member/create.do">회원 가입</a>
                            <a class="dropdown-item" href="#">아이디 찾기</a>
                            <a class="dropdown-item" href="#">비밀번호 찾기</a>
                            <a class="dropdown-item" href="#">비밀번호 변경</a>
                            <a class="dropdown-item" href="#">회원 정보 수정</a>
                            <a class="dropdown-item" href="#">회원 탈퇴</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">관리자</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href='/nbgrp/list_ajax.do'>카테고리 그룹</a>
                            <a class="dropdown-item" href=''>카테고리 전체</a>
                            <a class="dropdown-item"  href=''>카테고리 전체 Join</a>
                            <a class="dropdown-item" href=''>Youtube</a>
                            <a class="dropdown-item" href="/member/list.do">회원 목록</a>
                        </div>
                    </li>                    
                </ul>
            </div>    
        </nav>

    </div>
  
  <%-- 내용 --%> 
  <DIV class='content'>