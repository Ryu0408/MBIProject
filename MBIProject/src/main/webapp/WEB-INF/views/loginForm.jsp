<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap관련 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
    
	<title>MBI Login</title>
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>

.modal-login {
	color: #636363;
	width: 350px;
}
.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}
.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}
.modal-login h4 {
	text-align: center;
	font-size: 26px;
}
.modal-login  .form-group {
	position: relative;
}
.modal-login i {
	position: absolute;
	left: 13px;
	top: 11px;
	font-size: 18px;
}
.modal-login .form-control {
	padding-left: 40px;
}
.modal-login .form-control:focus {
	border-color: #00ce81;
}
.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 3px; 
}
.modal-login .hint-text {
	text-align: center;
	padding-top: 10px;
}
.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}
.modal-login .btn, .modal-login .btn:active {	
	border: none;
	background: #00ce81 !important;
	line-height: normal;
}
.modal-login .btn:hover, .modal-login .btn:focus {
	background: #00bf78 !important;
}
.modal-login .modal-footer {
	background: #ecf0f1;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -20px -20px;
	border-radius: 5px;
	font-size: 13px;
	justify-content: center;
}
.modal-login .modal-footer a {
	color: #999;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
.login-form {
    width: 340px;
    margin: 50px auto;
  	font-size: 15px;
}
.login-form form {
    margin-bottom: 15px;
    background: #f7f7f7;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    padding: 30px;
}
.login-form h2 {
    margin: 0 0 15px;
}
.form-control, .btn {
    min-height: 38px;
    border-radius: 2px;
}

 /* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 800px; /* Could be more or less, depending on screen size */
height: 270px; 
} 

</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
<script type="text/javascript">
   (function(){
      emailjs.init("user_GnLkKTTJ6lngC5rUgUvDI");
   })();
</script>
<script>

// 비밀번호 찾기 Modal창

function closeModal() {
	$('.searchModal').hide();
}

function openModel(){
	console.log("모달 실행")
 	$("#modal").show();
}

function postEmail(){
   const useremail = $("#userpw2").val();
   if(useremail === ''){
      alert('이메일을 입력하세요');
      return;
   }
   // Jquery를 이용한 ajax
   $.ajax({
      url:"${pageContext.request.contextPath}/loginForm/passwordSearch/" + useremail + "/",
      method:"GET",
      data:{useremail: useremail},
      dataType:"text",
      success : function(data) {
          result = JSON.parse(data);
          if (result[0] === '이메일이 발송되었습니다') {
          	  var templateParams = {	
                  email: useremail,
                  sendpw: result[1],
              };
          emailjs.send('gmail','template_D4VrVJfG',templateParams);
          alert(result[0]);
          } 
          else {
              alert(result[0]);
          }
      },
      error:function(data){
      	  console.log('데이터 통신 실패')
      }
   })
}
</script>


<body>
<c:if test="${not empty cookie.user_check}">
	<c:set value="checked" var="checked"/>
</c:if>

<script>
$('#loginBtn').click(function() {
	var id = $('#userid').val();
	var pw = $('#userpw').val();
	var remember_us = $('#remember_userid').is(':checked');
		$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/',
		data : {
			user_id : id,
			user_pw : pw,
			remember_userId : remember_us
			},
			success : function(data) {
				if (data[0] === 0) { //로그인 실패시
					console.log(data);
					location.href='${pageContext.request.contextPath}/loginForm/';
					alert('로그인 정보를 정확히 입력해주세요.');
				}  
				else if(data === 1){ //로그인 성공시
					console.log(data);
					location.href = '${pageContext.request.contextPath}/';
				}
			}
		});
	});
	
</script>

<div class="login-form">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/">
	<img src="${pageContext.request.contextPath }/img/logo.png" class="rounded-circle" alt="Cinque Terre"
		style="width: 350px;height: 150px"></a>
	<hr>
    <form method="POST">
        <h2 class="text-center">로그인</h2>       
        <div class="form-group">
            <input type="email" name="userid" class="form-control" id="userid"
            	value="${cookie.check.value}" placeholder="아이디" required="required">
        </div>
        <div class="form-group">
            <input type="password" name="userpw" class="form-control" 
            	id="userpw" placeholder="비밀번호" required="required">
        </div>
        <div class="form-group">
					<span class="font-weight-bold text-white bg-dark"
						id="spanLoginCheck"></span>
		</div>
        <div class="form-group">
            <button type="submit" id="loginBtn" class="btn btn-primary btn-block">로그인</button>
        </div>
        <div class="clearfix">
            <label class="float-left form-check-label">
            <c:if test="${empty cookie.user_check}">
            <input type="checkbox" name="remember_userid"${checked} checked="checked">
            </c:if>
            <c:if test="${not empty cookie.user_check}">
            <input type="checkbox" name="remember_userid"${checked}>
            </c:if>
            아이디 저장</label>
            <a href="#" class="float-right" onclick="openModel()">비밀번호 찾기</a>
        </div>        
    </form>
    <p class="text-center">
    <a href="${pageContext.request.contextPath }/loginForm/loginJoin/">회원 가입</a></p>
</div>

<!-- 모달 창(비밀번호 찾기) -->
<article>
    <div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h3>비밀번호 찾기</h3>
			</div>

			<form method="POST">
				<div class="form-group">
					<input type="text" name="userid" class="form-control" 
					id="userpw2" placeholder="아이디를 입력하세요" required="required">
				</div>
				<hr>
				<div class="btn btn-primary btn-block" 
				style="cursor:pointer; text-align: center;padding-bottom: 10px;
				padding-top: 10px;" onClick="postEmail()">	
					<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
						비밀번호 전송
					</span>
				</div>
				<br>
			</form>
			<div style="cursor:pointer;background-color:#DDDDDD;text-align: 
			center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">

				<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
					닫기
				</span>
			</div>
		</div>
	</div>
</article>
</html>