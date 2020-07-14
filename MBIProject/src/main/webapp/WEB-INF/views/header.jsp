<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap관련 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
    
	<title>MBI Homepage</title>
</head>
<body>
<header>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-4" >
		<a class="navbar-brand" href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/img/logo.png" alt="Cinque Terre"
		style="width: 200px;height: 100px"></a>
		<button type="button" class="btn btn-secondary" style ="width: 100px; margin-right: 30px" onclick="location.href='${pageContext.request.contextPath}/guideBoard/'">가이드</button>
		<button type="button" class="btn btn-secondary" style ="width: 100px; margin-right: 30px" onclick="location.href='${pageContext.request.contextPath}/hours24/'">24시정보</button>
		<button type="button" class="btn btn-secondary" style ="width: 100px;">이벤트</button>
	</div>
	<div class="col-sm-4">
	  	<nav class="navbar navbar-expand-sm" style="margin-top: 10px">
  			<!-- Brand/logo -->
  			<a class="navbar-brand" href="#" style ="margin-left: 100px">
    			<img src="${pageContext.request.contextPath }/img/login.jpg" style="width:40px;">
  			</a> 
  			<!-- Links -->
  			<ul class="navbar-nav">
    			<li class="nav-item" style ="margin-right: 40px">
    				OOO님 환영합니다<br>
    				<h6><small>(로그인 성공 시, 위치 변경 가능)</small></h6>
    			</li>
    			<li class="nav-item" style ="margin-right: 30px">
      				<a class="nav-link" href="${pageContext.request.contextPath}/loginForm/" style = "color: black; text-decoration:none">로그인</a>
    			</li>
    			<li class="nav-item">
      				<a class="nav-link" href="#" style = "color: black; text-decoration:none">마이페이지</a>
    			</li>
  			</ul>
		</nav>
	</div>
	<div class="col-sm-2"></div>
</div>
</header>
