<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<section style="height: 800px; clear: both;">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-2 text-white" style="margin-top: 50px;">
			<nav class="navbar bg-light">
				<ul class="navbar-nav"
					style="margin-top: 100px; text-align: center; width: 200px; height: 300px;">
					<li class="nav-item">
						<p style="color: black; font-size: 25pt;">카테고리</p>
					</li>
					<li class="nav-item"><a class="nav-link navType" href="#"
						style="margin-top: 20px;">가이드</a></li>
					<li class="nav-item"><a class="nav-link navType" href="#"
						style="margin-top: 20px;">24시</a></li>
					<li class="nav-item"><a class="nav-link navType" href="#"
						style="margin-top: 20px;">이벤트</a></li>
				</ul>
			</nav>
		</div>
		<div class="col-sm-6 text-white" style="margin-top: 50px;">
			<div class="content" style="border: 1px solid; margin-left: 30px;">
				<table class="table" id="common">
					<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody id="content">
						<c:forEach var="nlist" begin="1"  end="10" step="1" varStatus="i" items="${list}">
							<tr onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeRead/${nlist.noticesid }/'"  style='cursor:pointer;'>
								<td>${i.count }</td>
								<td>${nlist.noticecontent }</td>
								<td>${nlist.noticeid }</td>
								<td>${nlist.registdate }</td>
								<td>${nlist.noticeview }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="write" style="float: right;">
				<button onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeWrite/'">글쓰기</button>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<script>
    // writeBtn
    let btnw = document.getElementById('write');
    console.log('${user.userid}');
    if('${user.userid}' !== ''){ btnw.style.display = 'block'; }
    else if('${user.userid}' === '') { btnw.style.display = 'none';}
    

	//날짜를 yyyy-MM-dd 형식으로 변경하는 함수
	function getFormatDate(date){
		let year = date.getFullYear();
		let month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		let day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' + day;
	}
	
	let typeEvent = document.querySelectorAll('a.navType');
	let typeData = 0;
	
	for(let i=0; i<typeEvent.length; i++){
		typeEvent[i].addEventListener('click', function(event){
			// 콘솔 출력 <- 이벤트
			console.log(event.target.outerText);
			console.log(event);
			
			switch(event.target.outerText)
			{
				case '가이드':
					typeData = 0;
					category();
					break;
				case '24시':
					typeData = 1;
					category();
					break;
				case '이벤트':
					typeData = 2;
					category();
					break;
			}
		});
	}
	
  function category(){	
	const request = new XMLHttpRequest();
	request.open("GET", '${pageContext.request.contextPath}/noticeBoard/' + typeData + '/', true);
	request.setRequestHeader('Content-type', 'text; charset=UTF-8');
	//request.setRequestHeader('Content-type', 'application/json; charset=UTF-8');
	
	 request.onreadystatechange = function(){
		console.log(request.readyState, request.status);
		if (request.readyState == 4 && request.status == 200) {
			response = request.response;
			if(response !== '')
			{
				const result = JSON.parse(response);
				//console.log("res1 : " + JSON.parse(response));
				
				// 현재 메인페이지 'tbody > tr > td > 표의 내용을 삭제 
				const removeTag = document.getElementsByTagName('tr');
				const parentTag = document.getElementsByTagName('tbody')[0];
				parentTag.remove(removeTag);
				
				// 선택된 링크의 내용만 화면에 출력 type 0 : 가이드, 1 : 24시 2: 이벤트 내용만 출력
				const commonTag = document.getElementById('common');
				let tbd = document.createElement('tbody');
				//let tr1 = document.createElement('tr');
				let tr1='';
				let td1='';
				let cnt=1;
				let no=1;
				
				for(i in result)
				{	
					cnt = 0;
					tr1 = document.createElement('tr');
					for(j in result[i])
					{
						
						if(cnt == 5)
						{
							break;
						}
						
						td1 = document.createElement('td');
						console.log(result[i][j]);
							
						console.log("val : " + j);
						console.log("호출1: " + cnt);
						
						
						//console.log("res : " + result[i][j].hasOwnProperty(noticesid));
						console.log("결과: " + cnt);
						
						if(cnt === 0){
							///td1.innerText = result[i]['noticesid'];
							td1.innerText = no;
							console.log("no1 : " + no)
							no++;
						}if(cnt === 1){
							td1.innerText = result[i]['noticetitle'];
						}if(cnt === 2){
							td1.innerText = result[i]['noticeid'];
						}if(cnt === 3){
							td1.innerText = getFormatDate(new Date(result[i]['registdate']));
						}if(cnt === 4){
							td1.innerText = result[i]['noticeview'];	
						}
						
						//td1.style.border = '1px solid black';
						tr1.appendChild(td1);
						cnt++;
					}
					tbd.appendChild(tr1);
				}
				commonTag.appendChild(tbd);
				
			}else{
				//div.innerHTML = '<h2>검색 결과가 없습니다</h2>';
				alert('검색 결과가 없습니다');
			}
		}else{
			//div.innerHTML = '<h2>통신 실패</h2>';
			//alert('통신 실패');
		}
	  }
	  request.send();
   }
	
</script>
<jsp:include page="footer.jsp" />
</body>
</html>