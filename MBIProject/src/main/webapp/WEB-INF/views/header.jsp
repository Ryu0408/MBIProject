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
    
	<title>MBI Homepage</title>
</head>
<body>
<header style="position:sticky; top:-1px; z-index:1000;">
<div class="row" style="padding-bottom:30px; background-color:#fafafa;">
	<div class="col-sm-2"></div>
	<div class="col-sm-4" >
		<a class="navbar-brand" href="${pageContext.request.contextPath }" style="padding-top:20px;">
		<img src="${pageContext.request.contextPath }/img/logo.png" alt="Cinque Terre" style="width: 220px;height: 110px"></a>
	</div>
	<div class="col-sm-4">
		<div style="float:right;">
		  	<nav class="navbar navbar-expand-sm" style="margin-top: 10px">
	  			<!-- Brand/logo -->
	  			<a class="navbar-brand" href="#" style ="margin-left: 100px">
	    			<img src="${pageContext.request.contextPath }/img/login.jpg" style="width:40px;">
	  			</a> 
	  			<!-- Links -->
	  			<ul class="navbar-nav">
	    			<li class="nav-item" style ="margin-right: 40px; margin-top:8px;">
	    			<c:set var="vos" value="${userSession}" scope="session" />
	    			<c:if test="${not empty vos}">   				
	    				<h6><small><c:out value="${vos.username}님 " />환영합니다</small></h6>
	    			</c:if>
	    			</li>
	    			<li class="nav-item" style ="margin-right: 30px">
	    			<c:if test="${empty vos}">
	      				<a class="nav-link" href="${pageContext.request.contextPath}/loginForm/" style = "color: black; text-decoration:none">로그인</a>
	      			</c:if>
	      			<c:if test="${not empty vos}">
	      				<a class="nav-link" href="${pageContext.request.contextPath}/logout/" style = "color: black; text-decoration:none">로그아웃</a>
	      			</c:if>
	    			</li>
	    			<li class="nav-item">
	      				<a class="nav-link" href="#" style = "color: black; text-decoration:none" onclick="location.href='${pageContext.request.contextPath}/mypage/'">마이페이지</a>
	    			</li>
	  			</ul>
			</nav>
		</div>
		<div style="float:right;">
			<button type="button" class="btn btn-secondary" style ="width: 100px; margin-right: 30px" onclick="location.href='${pageContext.request.contextPath}/guideBoard/'">가이드</button>
			<button type="button" class="btn btn-secondary" style ="width: 100px; margin-right: 30px" onclick="location.href='${pageContext.request.contextPath}/hours24/'">24시정보</button>
			<button type="button" class="btn btn-secondary" style ="width: 100px;" onclick="location.href='${pageContext.request.contextPath}/noticeBoard/'">공지사항</button>
		</div>
	</div>
	<div class="col-sm-2"></div>
</div>
</header>
