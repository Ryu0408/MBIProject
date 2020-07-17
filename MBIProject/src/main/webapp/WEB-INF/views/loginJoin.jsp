<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<style>
.size {
	width: 50px;
	height: 30px;
}
.form-control {
	height: 41px;
	background: #f2f2f2;
	box-shadow: none !important;
	border: none;
}
.form-control:focus {
	background: #e2e2e2;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 500px;
	margin: 30px auto;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form h2  {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}
.signup-form hr  {
	margin: 0 -30px 20px;
}    
.signup-form .form-group {
	font-family: 'Roboto', sans-serif;
	margin-bottom: 20px;
}
.signup-form input[type="checkbox"] {
	margin-top: 3px;
}
.signup-form .row div:first-child {
	padding-right: 10px;
}
.signup-form .row div:last-child {
	padding-left: 10px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #3598dc;
	border: none;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #2389cd !important;
	outline: none;
}
.signup-form a {
	color: #3598dc;
	text-decoration: none;
}
.signup-form a:hover {
	text-decoration: underline;
}
.signup-form form a {
	color: #3598dc;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.signup-form .hint-text  {
	padding-bottom: 15px;
	text-align: center;
}
</style>
</head>
<body>
<div class="signup-form">
	<hr>
	
	<br>
    <form action="${pageContext.request.contextPath }/" method="post">
		<h2 align="center">회원 가입</h2>
		<hr>
		<div class="form-group">
        	<input type="text" style="text-align: center;" class="form-control" name="username" placeholder="성명" required="required">
        </div>
        <div class="form-group">
        	<input type="text" style="text-align: center;" class="form-control" name="userjumina" placeholder="주민번호(앞 6자리)" required="required"> - 
        	<input type="text" style="text-align: center;" class="form-control" name="userjuminb" placeholder="주민번호(뒤 7자리)" required="required">
        </div>
        <div class="form-group">
        	<input type="text" style="text-align: center;" class="form-control" name="userid" placeholder="사용할 아이디" required="required">
        </div>
		<div class="form-group">
            <input type="password" style="text-align: center;" class="form-control" name="userpw" placeholder="비밀번호(숫자, 영문자, 특수기호 사용하여 13자리 이상)" required="required">
        </div>
		<div class="form-group">
            <input type="password" style="text-align: center;" class="form-control" name="confirm_pw" placeholder="비밀번호 재입력" required="required">
        </div>        
		<div class="form-group" align="center">
            <button type="submit" class="btn btn-primary btn-lg">회원 가입</button>
        </div>
    </form>
    
	<div class="hint-text">이미 계정이 있으신가요? 
	<a href="${pageContext.request.contextPath}/loginForm/">&nbsp&nbsp로그인 바로가기</a>
	</div>
	
</div>

</body>
</html>