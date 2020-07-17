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
					<li class="nav-item"><a class="nav-link" href="#"
						style="margin-top: 20px;">가이드</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="margin-top: 20px;">24시</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="margin-top: 20px;">이벤트</a></li>
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
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nlist" begin="1"  end="10" step="1" varStatus="i" items="${list}">
							<tr>
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
	
</script>
<jsp:include page="footer.jsp" />
</body>
</html>