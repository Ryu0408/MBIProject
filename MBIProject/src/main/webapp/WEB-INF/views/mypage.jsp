<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
<style>

.card {
	display: inline-block;
	margin-left: 10px;
	box-shadow: 5px 5px 5px gray;
	text-align: center;
}

.card1 {
	display: inline-block;
	margin-left: 10px;
	box-shadow: 5px 5px 5px gray;
	text-align: center;
}

#box {
	
	position: absolute;
	width: 800px;
	height: 500px;
	top: 50%;
	left: 50%;
	margin-top: -150px;
	margin-left: -400px;
	background-color: #ededdf;
}
#wrap{ 
 	background-image: : url("/resources/img/cat.png") 
} 


</style>
<article>
<div id="wrap">
<div id="box" align="center">

	<div class="card" style="width: 300px; display: inline-block;">

		<div class="card-body text-center">
			<h5 class="card-title">나의 정보</h5>
			<p class="card-text">Alice is a freelance web designer and
				developer based in London. She is specialized in HTML5, CSS3,
				JavaScript, Bootstrap, etc.</p>
			<a href="#" class="btn btn-primary">나의정보 수정</a>
		</div>
	</div>

	<div class="card" style="width: 300px; display: inline-block;">
		<div class="card-body text-center">
			<h5 class="card-title">나의 관심사</h5>
			<p class="card-text">Alice is a freelance web designer and
				developer based in London. She is specialized in HTML5, CSS3,
				JavaScript, Bootstrap, etc.</p>
			<a href="#" class="btn btn-primary">관심사 보러가기</a>
		</div>
	</div>
	<div class="card1" style="width: 300px;">
		<div class="card-body text-center">
			<h5 class="card-title">기타1(일정표?)</h5>
			<p class="card-text">Alice is a freelance web designer and
				developer based in London. She is specialized in HTML5, CSS3,
				JavaScript, Bootstrap, etc.</p>
			<a href="#" class="btn btn-primary">View Profile</a>
		</div>
	</div>

	<div class="card1" style="width: 300px;">

		<div class="card-body text-center">
			<h5 class="card-title">기타2</h5>
			<p class="card-text">Alice is a freelance web designer and
				developer based in London. She is specialized in HTML5, CSS3,
				JavaScript, Bootstrap, etc.</p>
			<a href="#" class="btn btn-primary">View Profile</a>
		</div>
	</div>
</div>
</div>
</article>