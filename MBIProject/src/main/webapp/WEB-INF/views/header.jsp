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
		<a class="navbar-brand" href="#"><img src="https://lh3.googleusercontent.com/proxy/xKaAS5_RywmD1MdN-leLCXJjZoxV4AFQ6Rc1Hsb4miIjr9kMMusvKeIs_FG84-cNntgkY6C3I9FILKhoyqwby63dOMuHXq9arb1QLb3177GObDlCKkN2WZov4DxmrJ5BUCjFXMw" class="rounded-circle" alt="Cinque Terre"
		style="width: 200px;height: 100px"></a>
		<button type="button" class="btn btn-secondary" style ="width: 80px; margin-right: 70px" onclick="location.href='${pageContext.request.contextPath}/guideBoard/'>가이드</button>
		<button type="button" class="btn btn-secondary" style ="width: 80px; margin-right: 70px">24시</button>
		<button type="button" class="btn btn-secondary" style ="width: 80px;">이벤트</button>
	</div>
	<div class="col-sm-4">
	  	<nav class="navbar navbar-expand-sm" style="margin-top: 10px">
  			<!-- Brand/logo -->
  			<a class="navbar-brand" href="#" style ="margin-left: 100px">
    			<img src="https://thumb1.photo.cloud.naver.com/3472430162482377772?type=m3_2&nocache=2320101307" style="width:40px;">
  			</a> 
  			<!-- Links -->
  			<ul class="navbar-nav">
    			<li class="nav-item" style ="margin-right: 40px">
    				OOO님 환영합니다<br>
    				<h6><small>(로그인 성공 시, 위치 변경 가능)</small></h6>
    			</li>
    			<li class="nav-item" style ="margin-right: 30px">
      				<a class="nav-link" href="#" style = "color: black; text-decoration:none">로그인</a>
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
