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

<!-- JavaScript ajax -->
<script>
	let ajaxRet;
	function checkIdVanilla() {
		const email = document.querySelector('#userid').value;
		const emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		if(email === '') {
			id = document.getElementById('id');
			idmsg = document.getElementById('idmsg');
			idmsg.innerText = '';
// 			idmsg.style.color = 'red';
// 			alert('아이디를 입력하세요');
// 			document.getElementById('userid').focus();
			return false;
		}
		else if(!(emailRule.test(email))) {
			id = document.getElementById('id');
			idmsg = document.getElementById('idmsg');
			idmsg.innerHTML = '아이디는 이메일형식을 지켜 주세요';
			idmsg.style.color = 'red';
// 			document.getElementById('userid').focus();
			return false;
		}
	
		// 바닐라 자바스크립트
		const request = new XMLHttpRequest();
			
		request.open("POST", "${pageContext.request.contextPath}/loginForm/loginJoin/checkid/", true);
		request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		
		request.onreadystatechange = function(){
			if (request.readyState == 4 && request.status == 200) {
				idmsg.innerHTML = request.responseText;
				if(request.responseText === '사용 가능한 ID입니다') {
					idmsg.style.color = 'blue';
					ajaxRet = true;
				}
				else {
					idmsg.innerText = request.responseText;
					idmsg.style.color = 'red';
					$('#userid').focus();
					ajaxRet = false;
				}
			}
		}
		request.send("userid=" + email);	// POST
	}
</script>

<!-- password 복잡도 체크 -->
<script>
	function passwordComplexity(event) {
		const regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		const userpw = document.getElementById('userpw').value;
		const pwmsg = document.getElementById('pwmsg');
		
		if(userpw === ''){
			pwmsg.innerHTML = '';
		}
		else if(regExp.test(userpw) == false) {
			pwmsg.innerHTML = '비밀번호는 소문자,대문자,숫자의 조합으로 6~12자리 사이로 작성하세요';
			pwmsg.style.color = 'red';
			return false;
		}
		else {
			pwmsg.innerHTML = '비밀번호 확인 완료';
			pwmsg.style.color = 'blue';
			return true;
		}
	}
	
	function checkPassword(event) {
 		if(event.keyCode != 13 || event.keyCode != 9) {
		// 		13 : Enter, 9 : Tab
			const regExp = /^.*(?=^.{7,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	 		pass1 = document.getElementById('userpw').value;
	 		pass2 = document.getElementById('confirm_pw').value;
	 		
	 		if(pass2 === '') {
	 			document.getElementById('pwmsg2').innerHTML = '';
	 		}
	 		else if(regExp.test(pass1) && pass1 != pass2) {
 				document.getElementById('pwmsg2').innerHTML = '비밀번호를 확인해주세요';
	 			document.getElementById('pwmsg2').style.color = 'red';
	 		}
	 		else if(regExp.test(pass2) && pass1 == pass2) {
	 			document.getElementById('pwmsg2').innerHTML = '비밀번호가 일치합니다';
	 			document.getElementById('pwmsg2').style.color = 'blue';
	 		}
	 		else {
	 			document.getElementById('pwmsg2').innerHTML = '비밀번호를 확인해주세요';
	 			document.getElementById('pwmsg2').style.color = 'red';
	 		}
 		}
 	}
</script>

<!-- 폼을 서브밋 -->
<script>
	function submit(){
		
		// form의 각 항목이 빈 값인지 확인하기
		inputs = document.querySelectorAll('input.joinInput');
		cnt = 0;
		for(i = 0; i < inputs.length; i++) {
			if(inputs[i].value === '') {
				inputs[i].style.border = '1px solid red';
			}
			else {
				inputs[i].style.border = '1px solid black';
				cnt++;	// 값이 입력된 항목을 체크하여
			}
		}
		if(cnt !== inputs.length) return;	// 모든 항목의 개수와 일치하지 않으면 강제 종료
		document.getElementById('loginJoin').submit();
	}
	
</script>

<script>
	function validate() {
		var arrNum = new Array(13);
		var jumin = $("#jumin1").val() + $("#jumin2").val();
		var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
		console.log(jumin);
		//주민번호 유효성 검사
	    if (!fmt.test(jumin)) {
			alert('주민등록번호 형식에 맞게 입력해주세요');
	        $("#jumin1").focus();
	        return false;
	    }
		
		//주민번호 존재 검사
	    for (var i = 0; i < arrNum.length; i++){
	    	arrNum[i] = parseInt(jumin.charAt(i));
	    }
	 
	    var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
	    var sum = 0;
	 
	    for (var i = 0; i < 12; i++){
	      	sum += (arrNum[i] *= multipliers[i]);// 배열끼리12번 돌면서 
	    }
	 
	    if (((11 - (sum % 11)) % 10) != arrNum[12]) {
			alert('주민등록번호 형식에 맞게 입력해주세요');
	        $("#jumin1").focus();
	        return false;
	    }
	    else {
			alert('주민번호 검증 완료');
	    }
	}
</script>

<script>
	function finish_check() {
		if(document.getElementById('userid').value == '' 
				|| document.getElementById('userid').value == null){
			alert('아이디를 입력해 주세요');
			document.getElementById('userid').focus();
		}
		else if(document.getElementById('userpw').value == '' 
			|| document.getElementById('userpw').value == null){
			alert('비밀번호를 입력해 주세요');
			document.getElementById('userpw').focus();
		}
		else if(document.getElementById('confirm_pw').value == '' 
			|| document.getElementById('confirm_pw').value == null 
			|| (document.getElementById('userpw').value != document.getElementById('confirm_pw').value)){
			alert('비밀번호 재입력을 확인 해주세요');
			document.getElementById('confirm_pw').focus();
		}
		else if(document.getElementById('name').value == '' 
			|| document.getElementById('name').value == null){
			alert('이름을 입력해 주세요');
			document.getElementById('name').focus();
		}
		else if(document.getElementById('jumin1').value == '' 
			|| document.getElementById('jumin1').value == null ||
			document.getElementById('jumin2').value == '' 
				|| document.getElementById('jumin2').value == null){
			alert('주민번호를 확인 해주세요');
			document.getElementById('jumin1').focus();
		}
		else {
			alert('가입되었습니다');
		}
	}
</script>

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
	height: 700px;
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
.juminA {
	width: 200px;
	float: left;
	font-family: 'Roboto', sans-serif;
	margin-bottom: 20px;
}
.juminB {
	width: 200px;
	float: right;
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


<body>
<!--  style="overflow: hidden;" -->
<div class="signup-form">
	<hr>
	
	<br>
    <form method="POST">
		<h2 align="center">회원 가입</h2>
		<hr>
		<div class="form-group" id="id" onblur="checkIdVanilla()">
        	<input type="email" style="text-align: center;" class="form-control joinInput" 
        	name="userid" placeholder="사용할 아이디" id="userid"
        	onfocus="this.placeholder='' "onblur="this.placeholder='사용할 아이디'">
        	<span id="idmsg"></span>
        </div>
		<div class="form-group" onblur="passwordComplexity(event)">
            <input type="password" style="text-align: center;" class="form-control" 
            name="userpw" placeholder="소문자,대문자,숫자,특수기호의 조합으로 6~12자리" id="userpw"
            onfocus="this.placeholder='' "onblur="this.placeholder='소문자,대문자,숫자,특수기호의 조합으로 6~12자리'"
            class="joinInput">
        	<span id="pwmsg"></span>
        </div>
		<div class="form-group" onblur="checkPassword(event)">
            <input type="password" style="text-align: center;" class="form-control" 
            name="confirm_pw" placeholder="비밀번호 재입력" id="confirm_pw"
            onfocus="this.placeholder='' "onblur="this.placeholder='비밀번호 재입력'"
            class="joinInput">
            <span id="pwmsg2"></span>
        </div>
		<div class="form-group">
        	<input type="text" style="text-align: center;" class="form-control" 
        	name="username" placeholder="성명" id="name"
        	onfocus="this.placeholder='' "onblur="this.placeholder='성명'">
        </div>
        <div id="jumin">
        <div class="juminA">
        	<input type="text" style="text-align: center;" class="form-control" id="jumin1"
        	name="userjuminA" placeholder="주민번호(앞 6자리)" maxlength="6"
        	onfocus="this.placeholder='' "onblur="this.placeholder='주민번호(앞 6자리)'">
       	</div>
        <div class="juminB">
        	<input type="password" style="text-align: center;" class="form-control" id="jumin2"
        	name="userjuminB" placeholder="주민번호(뒤 7자리)" maxlength="7"
        	onfocus="this.placeholder='' "onblur="this.placeholder='주민번호(뒤 7자리)'" onblur="validate()">
<!--         	<input type="hidden" id="juminE" name="inputValue" maxlength="7"> -->
        </div>
        <span id="jmsg"></span>
        </div>
        <div class="form-group"><span id = "jmsg"></span></div>
		<div class="form-group" align="center">
            <button type="submit" id="loginJoin" class="btn btn-primary btn-lg" onclick="finish_check()">
            	회원 가입
            </button>
        </div>
    </form>
    
	<div class="hint-text">이미 계정이 있으신가요?&nbsp&nbsp
	<a href="${pageContext.request.contextPath}/loginForm/">로그인 바로가기</a>
	</div>
	
</div>
<script>
	
	checkIdVanilla();
// 	validate();
	
// 	document.getElementById('vanilla').checked = 'checked';
	document.getElementById('userid').addEventListener('keyup', checkIdVanilla);
	document.getElementById('userpw').addEventListener('keyup', passwordComplexity);
	document.getElementById('userpw').addEventListener('keyup', checkPassword);
	document.getElementById('confirm_pw').addEventListener('keyup', checkPassword);
	document.getElementById('jumin2').addEventListener('blur', validate);
// 	document.getElementById('jumin2').addEventListener('keyup', maskingJum);
	// 키를 눌렀다가 떼는 순간 이벤트 발생 (글자가 입력된 이후에 함수 실행)
	
	function enter(event) {
		if(event.keyCode == 13) submit();
	}
	document.querySelectorAll('input.joinInput').forEach( (input) => {
		input.addEventListener('keypress', enter);
	})
	
	document.getElementById('loginJoin').addEventListener('click', submit);
	
</script>
</html>