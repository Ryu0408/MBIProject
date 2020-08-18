<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a:hover {text-decoration: none; color: red;}
</style>
<section style="height: 800px; clear: both;">
	<hr>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<a href="${pageContext.request.contextPath }/">
				<span><img src="${pageContext.request.contextPath }/img/icons8-home-96.png" style="height:30px; width:30px"></span>
				</a>
				<span> > </span>
				<a href="${pageContext.request.contextPath }/guideBoard/" style="text-decoration:none; color:black;">
				<span> 가이드 </span>
				</a>
				<span> > </span>
				<!-- <a href="${pageContext.request.contextPath }/guideBoard/area/" style="text-decoration:none; color:black;"> -->
				<a href="${pageContext.request.contextPath }/noticeBoard/event/" style="text-decoration:none; color:black;">
				<span> 지역행사 </span>
				</a>
			</div>
			<div class="col-sm-2"></div>
		</div>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-2 text-white" style="margin-top: 50px;">
			<nav class="navbar bg-light">
				<ul class="navbar-nav"
					style="margin-top: 100px; text-align: center; width: 200px; height: 300px;">
					<li class="nav-item">
						<p style="color: black; font-size: 25pt;"><a href="${pageContext.request.contextPath }/guideBoard/" style="color: black; hover:text-decoration: none;">가이드</a></p>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/guideBoard/guide/"
						style="margin-top: 20px;text-decoration:none; color:black;">관광지</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/guideBoard/delicious/"
						style="margin-top: 20px;text-decoration:none; color:black;">맛집</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/guideBoard/area/"
						style="margin-top: 20px;text-decoration:none; color:black;">지역행사</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-sm-6 text-white" style="margin-top: 50px;">
			<div class="content" style="border: 1px solid; margin-left: 30px;">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="vo" items="${vo }">
							<tr onClick="location.href='${pageContext.request.contextPath }/guideBoard/readBoard/${vo.boardsid }/'" style="cursor:pointer;">
								<td class="boardsid"> ${vo.boardsid }</td>
								<td class="boardtitle"> ${vo.boardtitle}</td>
								<td class="boardid"> ${vo.boardid }</td>
								<td class="boardview"> ${vo.boardview }</td>
								<td class="boardgood"> ${vo.boardgood }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="paging" style="color: black; margin: auto; text-align: center;">
				<c:if test="${prev }">
					<a href="${pageContext.request.contextPath}/guideBoard/area/${begin - 1}/">◀</a>
				</c:if>
				<c:forEach var="i" begin="${begin}" end="${end}">
				<c:if test="${i == page }">
					<strong>[${i }]</strong>
				</c:if>
				<c:if test="${i != page }">
					<a href="${pageContext.request.contextPath}/guideBoard/area/${i }/">
				 		[${i }]
					</a>
				</c:if>
				</c:forEach>
				<c:if test="${next }">
					<a href="${pageContext.request.contextPath}/guideBoard/area/${end + 1}/">▶</a>
				</c:if>
			</div>
			

			<c:set var="vos" value="${userSession}" scope="session" />
			<c:if test="${not empty vos }">
				<div id="write" style="float: right;">
					<button onclick="location.href='${pageContext.request.contextPath}/guideBoard/writeBoard/'">글쓰기</button>
				</div>
			</c:if>
			
		</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>