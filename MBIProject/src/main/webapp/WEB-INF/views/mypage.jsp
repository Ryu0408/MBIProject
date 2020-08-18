<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function closeModal() {
		$('.searchModal').hide();
	}

	function openModel() {
		$("#modal").show();
		// Jquery를 이용한 ajax
		var username = "<c:out value="${vos.username}" />";
		console.log(username);
		if(username === '') {
			alert('로그인 한 후에 이용해 주세요');
			location.href = '${pageContext.request.contextPath}/loginForm/';
		}
		
		$.ajax({
					url : "${pageContext.request.contextPath}/mypage/"
							+ username + "/",
					method : "POST",
					dataType : "text",
					data : {username:username},
					success : function(data) {
						console.log("아무");
						mplist = JSON.parse(data);
						console.log(mplist);
						$("#name").text(mplist[0].username);
						$("#id").text(mplist[0].userid);
						$("#pw").text(mplist[0].userpw);
						$("#regist").text(mplist[0].registdate);
						
					},
					error : function(data) {
						alert('서버 통신 실패1');
					}
				})
	}
	
	function updatepw() {
// 		$("#modal").show();
		// Jquery를 이용한 ajax
		
		var confirmpw = $("#confirmPw").val();
		var username = "<c:out value="${vos.username}" />";
		console.log(confirmpw);
		const regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		alert('업데이트 넘어옴');
		
		if(regExp.test(confirmpw) == false) {
			alert('비밀번호는 소문자,대문자,숫자의 조합으로 6~12자리 사이로 작성하세요');
			return false;
		}
		
		$.ajax({
					url : "${pageContext.request.contextPath}/mypage/"
							+ username + "/",
					method : "POST",
					dataType : "text",
					data : {confirmpw:confirmpw},
					success : function(data) {
						mplist = JSON.parse(data);
						console.log(mplist);
						alert('비밀번호를 바꾸었습니다.');
						$("#name").text(mplist[0].username);
						$("#id").text(mplist[0].userid);
						$("#pw").text(mplist[0].userpw);
						$("#regist").text(mplist[0].registdate);
					},
					error : function(data) {
						console.log(data);
						alert('서버 통신 실패2 : ');
					}
				})
	}
	
	function deleteConfirm() {
		var result = confirm('정말로 탈퇴 하시겠습니까?');
		
		if(result == true)	delUser();
		else				openModel();
	}
	
	function delUser() {
		var username = "<c:out value="${vos.username}" />";
		var delInfo = "del";
		
		$.ajax({
			url : "${pageContext.request.contextPath}/mypage/"
					+ username + "/",
			method : "POST",
			dataType : "text",
			data : {confirmpw:delInfo},
			success : function(data) {
				console.log(data);
				alert('정상적으로 탈퇴 되었습니다.');
				location.href = '${pageContext.request.contextPath}/';
			},
			error : function(data) {
				console.log(data);
				alert('서버 통신 실패3 : ');
			}
		})
	}
	
</script>

<style>
.card {
	margin-top: 65px;
	margin-bottom: 65px;
	display: inline-block;
	margin-left: 10px;
	box-shadow: 5px 5px 5px gray;
	text-align: center;
}

#box {
	background-color: #f5f5dc;
	width: 930px height: 250px;
}

#wrap {
	background-image: : url("/resources/img/cat.png") background-color : 
		#ededdf;
}

#mypage table td, th {
	width: 100px;
	border: 1px solid #444444;
	border-collapse: collapse;
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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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

<article style="overflow: hidden;">
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<h1>나의 정보</h1>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<div id="ListBox" style="padding-top: 20px;">
								<div>
									<div>이름</div>
									<div id="name"></div>
									<div class="input-group mb-3">
									</div>
								</div>
								<div>
									<div>아이디</div>
									<div id="id"></div>
									<div class="input-group mb-3"></div>
								</div>
							</div>
							<div>
								<div>비밀번호</div>
								<div id="pw"></div>
								<div class="input-group mb-3">
									<input type="password" id="confirmPw" class="form-control"
										placeholder="바꿀 비밀번호를 입력하세요" aria-label="Recipient's username"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary"
										onclick="updatepw()" type="button">수정</button>
									</div>
								</div>
							</div>
							<div>
								<div>가입날짜</div>
								<div id="regist"></div>
								<div class="input-group mb-3"></div>
							</div>
							<div
								style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
								onclick="closeModal();">
								<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기
								</span>
							</div>
							<div
								style="cursor: pointer; background-color: #0054FF; 
								text-align: center; padding-bottom: 10px; padding-top: 10px;"
								onclick="deleteConfirm()">
								<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">회원탈퇴
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>

	</div>

	<div id="wrap">
		<div id="box" align="center">

			<div class="card" style="width: 300px; display: inline-block;">

				<div class="card-body text-center">
					<h5 class="card-title">
						<strong>나의 정보</strong>
					</h5>
					<p class="card-text">
						<br> <br>프로필 정보입니다. 수정 화면에서 프로필 사진과 별명을 변경하세요.<br>
						<br>
					</p>
					<a href="javascript:void(0)" id="mypage" class="btn btn-primary"
						onclick="openModel()">나의정보 수정</a>
				</div>
			</div>

			<div class="card" style="width: 300px; display: inline-block;">
				<div class="card-body text-center">
					<h5 class="card-title">
						<strong>연 락 처</strong>
					</h5>
					<p class="card-text">
						<br> <br> 이름 및 정확한 연락처 정보는 수정 화면에서 확인 가능합니다.<br> <br>
					</p>
					<a href="#" class="btn btn-primary" onclick="openModel2()">수정하기</a>
				</div>
			</div>
			<div class="card" style="width: 300px; display: inline-block;">
				<div class="card-body text-center">
					<h5 class="card-title">
						<Strong>인 증 서</strong>
					</h5>
					<p class="card-text">
						<br> <br>“본인인증·서명은 간편하게” 지금 바로 네이버 앱에서 이용해보세요.<br>
						<br>
					</p>
					<a href="#" class="btn btn-primary">이력 확인</a>
				</div>
			</div>

			<div class="card" style="width: 300px; display: inline-block;">

				<div class="card-body text-center">
					<h5 class="card-title">
						<strong>지역 설정</strong>
					</h5>
					<p class="card-text">
						<br> <br>설정된 지역이 없습니다. 지금 내 주변의 관심지역을 설정하세요!<br> <br>
					</p>
					<a href="#" class="btn btn-primary">설정하기</a>
				</div>
			</div>
		</div>
	</div>
</article>
<jsp:include page="footer.jsp" />
