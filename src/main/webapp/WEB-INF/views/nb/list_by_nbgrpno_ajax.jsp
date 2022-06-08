<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>노트북 쇼핑몰</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
    
<script type="text/javascript">
    $(function() {
        $('#btn_create_cancel').on('click', cancel);
        $('#btn_update_cancel').on('click', cancel);
        $('#btn_delete_cancel').on('click', cancel);
    });

    function read_update_ajax(nbno) {
        // console.log('update');
        $('#panel_create').css('display', 'none');
        $('#panel_update').css('display', '');
        $('#panel_delete').css('display', 'none');

        // console.log('-> nbno:' + nbno);
        var params = "";
        // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
        params = 'nbno=' + nbno; // 공백이 값으로 있으면 안됨.

        $.ajax(
          {
            url: '/nb/read_ajax.do',
            type: 'get',  // get, post
            cache: false, // 응답 결과 임시 저장 취소
            async: true,  // true: 비동기 통신
            dataType: 'json', // 응답 형식: json, html, xml...
            data: params,      // 데이터
            success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
              // {"nbgrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
                let nbgrpno = rdata.nbgrpno;
                let rdate = rdata.rdate;
                let name = rdata.name;
                let cnt = rdata.cnt;
                let nbno = rdata.nbno;

              let frm_update = $('#frm_update');
              $('#nbno', frm_update).val(nbno);
              $('#cnt', frm_update).val(cnt);
              $('#name', frm_update).val(name);
              $('#rdate', frm_update).val(rdate);
              $('#nbgrpno', frm_update).val(nbgrpno);
              
              // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
              // console.log('-> btn_recom: ' + $('#btn_recom').html());
              // $('#btn_recom').html('♥('+rdata.recom+')');
              $('#span_animation').hide();
            },
            // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
            error: function(request, status, error) { // callback 함수
              console.log(error);
            }
          }
        );  //  $.ajax END

        $('#span_animation').css('text-align', 'center');
        $('#span_animation').html("<img src='/contents/images/ani03.gif' style='width: 3.5%;'>");
        $('#span_animation').show(); // 숨겨진 태그의 출력
    }

    function cancel() {
        $('#panel_create').css('display', '');
        $('#panel_update').css('display', 'none');
        $('#panel_delete').css('display', 'none');
    }

    // 삭제 폼(자식 레코드가 없는 경우의 삭제)
    function read_delete_ajax(nbno) {
      $('#msg_count_by_nbno').hide();
      $('#btn_submit').show();
      
      $('#panel_create').css("display","none"); // hide, 태그를 숨김
      $('#panel_update').css("display","none"); // hide, 태그를 숨김  
      $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
      // return;
      
      // console.log('-> nbgrpno:' + nbgrpno);
      var params = "";
      // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      params = 'nbno=' + nbno; // 공백이 값으로 있으면 안됨.
      
      $.ajax(
        {
          url: '/nb/read_ajax2.do',
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: true,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
          data: params,      // 데이터
          success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
            // {"nbgrpno":1,"visible":"Y","seqno":1,"rdate":"2021-04-08 17:01:28","name":"문화"}
        	  let nbgrpno = rdata.nbgrpno;
              let name = rdata.name;
              let cnt = rdata.cnt;
              let nbno = rdata.nbno;
            // var rdate = rdata.rdate;
            let count_by_nbno = parseInt(rdata.count_by_nbno); // 카테고리 그룹에 속한 카테고리수
            console.log('count_by_nbno: ' + count_by_nbno);

            let frm_delete = $('#frm_delete');
            $('#nbno', frm_delete).val(nbno);
            $('#frm_delete_nbgrpno').html(nbgrpno);
            $('#frm_delete_name').html(name);  // <label>그룹 이름</label><span id='frm_delete_name'></span>  
            
            if (count_by_nbno > 0) { // 자식 레코드가 있다면
              $('#msg_count_by_nbno').show();
              $('#btn_submit').hide();
            } else {
              $('#msg_count_by_nbno').hide();
              $('#btn_submit').show();
            }
            // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
            // console.log('-> btn_recom: ' + $('#btn_recom').html());
            // $('#btn_recom').html('♥('+rdata.recom+')');
            $('#span_animation_delete').hide();
          },
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );  //  $.ajax END
      $('#span_animation_delete').css('text-align', 'center');
      $('#span_animation_delete').html("<img src='/contents/images/ani03.gif' style='width: 3.5%;'>");
      $('#span_animation_delete').show(); // 숨겨진 태그의 출력
    }
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../nbgrp/list.do" class='title_link'>카테고리 그룹</A> > ${nbgrpVO.name }</DIV>

<DIV class='content_body'>

  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>카테고리 그룹 번호</label>
      <input type='hidden' name='nbgrpno' value='${param.nbgrpno }' >
      ${param.nbgrpno } 
    
      <label>카테고리 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'
                 autofocus="autofocus">
  
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
    text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type="hidden" name="nbno" id="nbno" value="">
      
      <label>카테고리 그룹 번호</label>
      <input type='number' name='nbgrpno' id='nbgrpno' value='' 
                 required="required" min="1" max="100" step="1" autofocus="autofocus">
      <label>카테고리 이름</label>
      <input type='text' name='name' id='name' value='' required="required" style='width: 25%;'>  
  
      <button type="submit" id='submit'>저장</button>
      <button type="button" id="btn_update_cancel">취소</button>
      <span id='span_animation'></span>
    </FORM>
  </DIV>
  
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
    text-align: center; display: none;'>
    <div class="msg_warning">카테고리를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='nbno' id='nbno' value="">
      
      <label>그룹 번호</label>: <span id='frm_delete_nbgrpno'></span>  
      <label>카테고리</label>: <span id='frm_delete_name'></span> 
      
      <div id='msg_count_by_nbno' 
             style='color: #FF0000; font-weight: bold; display: none; margin: 10px auto;'>    
        『관련 콘텐츠가 존재합니다 모두 삭제해주세요.』
        
      </div>
       
      <button type="submit" id='btn_submit' class='btn btn-danger'>삭제</button>
      <button type="button" id='btn_delete_cancel' class='btn'>취소</button>
      <span id='span_animation_delete'></span>
    </FORM>
  </DIV>

  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리<br> 번호</TH>
      <TH class="th_bs">카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="nbVO" items="${list}">
      <c:set var="nbno" value="${nbVO.nbno }" />
      <TR>
        <TD class="td_bs">${nbVO.nbno }</TD>
        <TD class="td_bs">${nbVO.nbgrpno }</TD>
        <TD class="td_bs_left"><a href="../contents/list_by_nbno_search_paging.do?nbno=${nbno}&now_page=1">${nbVO.name }</a></TD>
        <TD class="td_bs">${nbVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <A href="../contents/create.do?nbno=${nbno }" title="${name }등록"><i class="fa-solid fa-circle-plus"></i></A>
          <A href="javascript: read_update_ajax(${nbno })" title="수정"><i class="fa-solid fa-pen"></i></A>
          <A href="javascript: read_delete_ajax(${nbno })" title="삭제"><i class="fa-solid fa-trash"></i></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>