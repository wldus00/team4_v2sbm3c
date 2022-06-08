<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="dev.mvc.nbgrp.NbgrpVO"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>노트북 쇼핑몰</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
</head>

<script type="text/javascript">
    $(function() {
        $('#btn_create_cancel').on('click', cancel);
        $('#btn_update_cancel').on('click', cancel);
        $('#btn_delete_cancel').on('click', cancel);
    });

    function read_update_ajax(nbgrpno) { // 수정
        // console.log('update');
        $('#panel_create').css('display', 'none'); // 태그 감추기
        $('#panel_update').css('display', ''); // 태그 출력 

        // console.log('-> nbgrpno:' + nbgrpno);
        let params = "";
        // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        params = 'nbgrpno=' + nbgrpno; // 공백이 값으로 있으면 안됨.

        $.ajax({
            url : '/nbgrp/read_ajax.do',
            type : 'get', // get, post
            cache : false, // 응답 결과 임시 저장 취소
            async : true, // true: 비동기 통신
            dataType : 'json', // 응답 형식: json, html, xml...
            data : params, // 데이터
            success : function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
                // {"categrpno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
                let nbgrpno = rdata.nbgrpno;
                let name = rdata.name;
                let rdate = rdata.rdate;

                let frm_update = $('#frm_update'); // id가 frm_update인 태그
                $('#nbgrpno', frm_update).val(nbgrpno); // frm_update 폼에서 id가 categrpno인 태그
                $('#name', frm_update).val(name);
                $('#rdate', frm_update).val(rdate);

                // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
                // console.log('-> btn_recom: ' + $('#btn_recom').html());
                // $('#btn_recom').html('♥('+rdata.recom+')');
                $('#span_animation').hide();
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error : function(request, status, error) { // callback 함수
                console.log(error);
            }
        }); //  $.ajax END

        $('#span_animation').css('text-align', 'center');
        $('#span_animation').html(
                "<img src='/nbgrp/images/ani03.gif' style='width: 3%;'>");
        $('#span_animation').show(); // 숨겨진 태그의 출력

    }

    function cancel() { // 초기 상태로 변경
        $('#panel_create').css('display', '');
        $('#panel_update').css('display', 'none'); // 태그 출력
        $('#panel_delete').css('display', 'none'); // 태그 출력 
    }

    // 삭제 폼(자식 레코드가 없는 경우의 삭제)
    function read_delete_ajax(nbgrpno) {
        $('#msg_count_by_nbgrpno').hide();
        $('#btn_submit').show(); // 삭제 버튼 출력

        $('#panel_create').css("display", "none"); // 태그를 숨김
        $('#panel_update').css("display", "none"); // 태그를 숨김  
        $('#panel_delete').css("display", ""); // show, 숨겨진 태그 출력 
        // return;

        // console.log('-> categrpno:' + categrpno);
        let params = "";
        // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        params = 'nbgrpno=' + nbgrpno; // 공백이 값으로 있으면 안됨.

        $.ajax({
            url : '/nbgrp/read_ajax2.do',
            type : 'get', // get, post
            cache : false, // 응답 결과 임시 저장 취소
            async : true, // true: 비동기 통신
            dataType : 'json', // 응답 형식: json, html, xml...
            data : params, // 데이터
            success : function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
                // {"categrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
                let categrpno = rdata.nbgrpno;
                let name = rdata.name;
                // var rdate = rdata.rdate;
                let count_by_nbgrpno = parseInt(rdata.count_by_nbgrpno); // 카테고리 그룹에 속한 카테고리수
                console.log('count_by_nbgrpno: ' + count_by_nbgrpno);

                let frm_delete = $('#frm_delete');
                $('#nbgrpno', frm_delete).val(nbgrpno);

                $('#frm_delete_name').html(name); // <label>그룹 이름</label><span id='frm_delete_name'></span>  

                if (count_by_nbgrpno > 0) { // 자식 레코드가 있다면
                    $('#msg_count_by_nbgrpno').show();
                    $('#btn_submit').hide(); // 삭제 버튼 숨기기
                } else {
                    $('#msg_count_by_nbgrpno').hide();
                    $('#btn_submit').show(); // 삭제 버튼 출력
                }

                $('#span_animation_delete').hide();
            },
            error : function(request, status, error) { // callback 함수
                console.log(error);
            }
        }); //  $.ajax END

        $('#span_animation_delete').css('text-align', 'center');
        $('#span_animation_delete').html(
                "<img src='/nbgrp/images/ani03.gif' style='width: 3%;'>");
        $('#span_animation_delete').show(); // 숨겨진 태그의 출력
    }
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>카테고리 그룹</DIV>

<DIV class='content_body'>
  <%-- 신규 등록 --%>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                                              text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>그룹 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
       
      <button type="submit" id='submit' class='btn'>등록</button>
      <button type="button" id='btn_create_cancel' class='btn'>취소</button>
    </FORM>
  </DIV>
  
  <!-- 수정 -->
  <DIV id='panel_update' 
          style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                    text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='nbgrpno' id='nbgrpno' value=''>

      <label>그룹 이름</label>
      <input type='text' name='name' id='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
       
      <button type="submit" id='submit' class='btn'>저장</button>
      <button type="button" id='btn_update_cancel' class='btn'>취소</button>
      
      <span id='span_animation'></span>
      
    </FORM>
  </DIV>
  
  <%-- 삭제 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
          width: 100%; text-align: center; display: none;'>
    <div class="msg_warning">카테고리 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='nbgrpno' id='nbgrpno' value=''>
        
      <label>그룹 이름</label>: <span id='frm_delete_name'></span>  
      
      <div id='msg_count_by_nbgrpno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>
        『관련 카테고리가 존재합니다. 모두 삭제해주세요.』
      </div>
      <br>
      <button type="submit" id='btn_submit' class='btn btn-danger'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn btn-info'>취소</button>
      
      <span id='span_animation_delete'></span>
            
    </FORM>
  </DIV>  
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 45%;'/>
      <col style='width: 30%;'/>   
      <col style='width: 25%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">이름</TH>
      <TH class="th_bs">등록일</TH> 
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    
    <c:forEach var="nbgrpVO" items="${list}">
      <c:set var="nbgrpno" value="${nbgrpVO.nbgrpno }" />
      <c:set var="name" value="${nbgrpVO.name }" />
      
      <TR>
        <TD class="td_bs_left" style='text-align: center;'>
        <A href="../nb/list_by_nbgrpno.do?nbgrpno=${nbgrpno }">${name }</A></TD>
        <TD class="td_bs">${nbgrpVO.rdate.substring(0, 10) }</TD>     
        <TD class="td_bs">
          <A href="../nb/create.do?nbgrpno=${nbgrpno }" title="${name } 등록"><i class="fa-solid fa-pen-to-square"></i></A>
          <A href="javascript: read_update_ajax(${nbgrpno })" title="수정"><i class="fa-regular fa-pen-to-square"></i></A>
          <A href="javascript: read_delete_ajax(${nbgrpno })" title="삭제"><i class="fa-solid fa-eraser"></i></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>


