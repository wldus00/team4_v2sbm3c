<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="dev.mvc.nbgrp.NbgrpVO"%>
<%@ page import="dev.mvc.nb.NbVO"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>노트북 쇼핑몰</title>
<!-- /static 기준 -->
 <!-- <link href="/css/style.css" rel="Stylesheet" type="text/css"> -->
 <link href="/css/main.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />

    <div id="main">
        <br>
<div class="card text-white">
  <img src="./css/images/배경.jpg" class="card-img" alt="배경화면">
  <div class="card-img-overlay">
    <h5 class="card-title">기능별 노트북 상품 목록</h5>
    <div class="card-body">
    <a href="/nbgrp/list.do">기능별 노트북 보러가기</a>
    </div>
  </div>
</div>

        <h3 class="title_1">게임용 노트북</h3>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card h-100">
                    <c:forEach var="nbVO" items="${list}" begin="0" end="0">
                        <c:set var="nbno" value="${nbVO.nbno }" />
                        <c:set var="name" value="${nbVO.name }" />
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/오디세이.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">게임용 노트북/삼성</a></h5>
                            오디세이 / 레노버 / 블레이드 블랙
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col">
                    <div class="card h-100">
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/맥북에어m1.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                          <c:forEach var="nbVO" items="${list}" begin="1" end="1">
                            <c:set var="nbno" value="${nbVO.nbno }" />
                            <c:set var="name" value="${nbVO.name }" />
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">게임용 노트북/애플</a></h5>
                            맥북에어 m1 / 맥북에어 m2
                          </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/LG노트북.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                          <c:forEach var="nbVO" items="${list}" begin="2" end="2">
                            <c:set var="nbno" value="${nbVO.nbno }" />
                            <c:set var="name" value="${nbVO.name }" />
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">게임용 노트북/LG</a></h5>
                            LG 울트라슬림 /
                          </c:forEach>
                        </div>
                    </div>
                </div>
        </div>
        <br>
        <h3 class="title_1">사무용 노트북</h3>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100">
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/이온2.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                          <c:forEach var="nbVO" items="${list}" begin="3" end="3">
                            <c:set var="nbno" value="${nbVO.nbno }" />
                            <c:set var="name" value="${nbVO.name }" />
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">사무용 노트북/삼성</a></h5>
                            이온1 / 이온2
                          </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/맥북프로.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                          <c:forEach var="nbVO" items="${list}" begin="4" end="4">
                            <c:set var="nbno" value="${nbVO.nbno }" />
                            <c:set var="name" value="${nbVO.name }" />
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">사무용 노트북/애플</a></h5>
                            맥북에어11 / 맥북프로
                          </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <a href="../contents/list_paging.do?nbno=${nbno }&now_page=1"><img src="./css/images/lg그램.jpg" class="card-img-top" alt="..."></a>
                        <div class="card-body">
                          <c:forEach var="nbVO" items="${list}" begin="5" end="5">
                            <c:set var="nbno" value="${nbVO.nbno }" />
                            <c:set var="name" value="${nbVO.name }" />
                            <h5 class="card-title"><a href="../contents/list_paging.do?nbno=${nbno }&now_page=1">사무용 노트북/LG</a></h5>
                            LG그램
                          </c:forEach>
                        </div>
                    </div>
                </div>
        </div>
        <div class="chatbot">
  <a href="#"><img alt="챗봇" src="./css/images/channeltalk.png"></a>
</div>
</div>
<jsp:include page="./menu/bottom.jsp" flush='false' /> 
</body>
</html>