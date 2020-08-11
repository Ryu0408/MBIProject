<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

.card {
	margin-top :65px;
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
	height: 600px;
	top: 40%;
	left: 50%;
	margin-top: -100px;
	margin-left: -400px;
	background-color: #ededdf;
}
#wrap{ 
 	background-image: : url("/resources/img/cat.png") 
}
#mypage table td, th {
	width:100px;
	border: 1px solid #444444;
    border-collapse: collapse;
}
.listid {

	position: absolute;
	width: 200px;
	height: 100px;
	top: 40%;
	left: 50%;
	margin-top: -100px;
	margin-left: -400px;
	background-color: #ededdf;
	

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
width: 70%; /* Could be more or less, depending on screen size */
}

</style>
    <script>    
function closeModal() {
$('.searchModal').hide();
};
 
function openModel(){
	$("#modal").show();
	// Jquery를 이용한 ajax
	var username = "<c:out value="${vos.username}" />";
	console.log(username);
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/" + username + "/",
	    	method:"POST",
	      	data:{username : username},
	      	dataType:"text",
	      	success : function(data) {
	      		console.log("아무");
				mplist = JSON.parse(data);
				console.log(mplist);
				$("#name").text(mplist[0].username);
				$("#id").text(mplist[0].userid);
				$("#pw").text(mplist[0].userpw);
				$("#regist").text(mplist[0].registdate);
	      	},
	      	error:function(data){
	         	alert('서버 통신 실패');
	      	}
	})
};

</script>
<article>
    <div id="modal" class="searchModal">
<div class="search-modal-content">
<div class="page-header">
<h1>나의 정보를 받아오기</h1>
</div>
<div class="row">
<div class="col-sm-12">
<div class="row">
<div class="col-sm-12">

<div id="ListBox" style="padding-top:20px;">
		<div>
	    	<div >이름</div>
	        <div id="name" class="listname"></div>
		</div>
	    <div>
	        <div>아이디</div>
	      	<div id="id" class=""></div>	        	
	    </div>
	    <div>
	        <div>비밀번호</div>
	      	<div id="pw" class="listpw"></div>
	    </div>
	    <div>
	        <div>가입날짜</div>
	      	<div id="regist" class="listregist"></div>
	    </div>
	        
	</div>
</div>
</div>
</div>
</div>
<hr>
<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기
</span>
</div>
</div>
</div>


<div id="wrap">
<div id="box" align="center">

	<div class="card" style="width: 300px; display: inline-block;">

		<div class="card-body text-center">
			<h5 class="card-title"><strong>나의 정보</strong></h5>
			<p class="card-text"><br><br><br><br></p>
			<a href="javascript:void(0)" id ="mypage" class="btn btn-primary" onclick="openModel()">나의정보 수정</a>
		</div>
	</div>

	<div class="card" style="width: 300px; display: inline-block;">
		<div class="card-body text-center">
			<h5 class="card-title"><strong>연 락 처</strong></h5>
			<p class="card-text"><br><br><br><br></p>
			<a href="#" class="btn btn-primary">관심사 보러가기</a>
		</div>
	</div>
	<div class="card1" style="width: 300px;">
		<div class="card-body text-center">
			<h5 class="card-title"><Strong>인 증 서</strong></h5>
			<p class="card-text"><br><br>“본인인증·서명은 간편하게”
지금 바로 네이버 앱에서 이용해보세요.<br><br></p>
			<a href="#" class="btn btn-primary">View Profile</a>
		</div>
	</div>

	<div class="card1" style="width: 300px;">

		<div class="card-body text-center">
			<h5 class="card-title"><strong>지역 설정</strong></h5>
			<p class="card-text"><br><br>설정된 지역이 없습니다.
지금 내 주변의 관심지역을 설정하세요!<br><br></p>
			<a href="#" class="btn btn-primary">View Profile</a>
		</div>
	</div>
</div>
</div>
</article>
