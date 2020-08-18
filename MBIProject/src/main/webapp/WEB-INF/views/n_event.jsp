<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<section style="height: 800px; clear: both;">
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<a href="${pageContext.request.contextPath }/">
			<span><img src="${pageContext.request.contextPath }/img/icons8-home-96.png" style="height:30px; width:30px"></span>
			</a>
			<span> > </span>
			<a href="${pageContext.request.contextPath }/noticeBoard/notice/" style="text-decoration:none; color:black;">
			<span> 공지사항 </span>
			</a>
			<span> > </span>
			<a href="${pageContext.request.contextPath }/noticeBoard/24hour/" style="text-decoration:none; color:black;">
			<span> 공모전 </span>
			</a>
			<span> > </span>
			<a href="${pageContext.request.contextPath }/noticeBoard/event/" style="text-decoration:none; color:black;">
			<span> 이벤트 </span>
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
						<p style="color: black; font-size: 25pt;"><a href="${pageContext.request.contextPath }/noticeBoard/" style="color: black;text-decoration: none;">공지사항</a></p>
					</li>
					<li class="nav-item"><a class="nav-link navType" href='${pageContext.request.contextPath}/noticeBoard/notice/'
						style="margin-top: 20px;text-decoration:none; color:black;">공지사항</a></li>
					<li class="nav-item"><a class="nav-link navType" href='${pageContext.request.contextPath}/noticeBoard/24hour/'
						style="margin-top: 20px;text-decoration:none; color:black;">공모전</a></li>
					<li class="nav-item"><a class="nav-link navType" href='${pageContext.request.contextPath}/noticeBoard/event/'
						style="margin-top: 20px;text-decoration:none; color:black;">이벤트</a></li>
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
						<!-- 
						<c:forEach var="nlist" begin="1"  end="10" step="1" varStatus="i" items="${list}">
							<tr onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeRead/${nlist.noticesid }/'"  style='cursor:pointer;'>
								<td>${i.count }</td>
								<td>${nlist.noticecontent }</td>
								<td>${nlist.noticeid }</td>
								<td>${nlist.registdate }</td>
								<td>${nlist.noticeview }</td>
							</tr>
						</c:forEach>
						 -->
						 <c:forEach var="nlist" items="${list }">
						 	<tr onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeRead/${nlist.noticesid }/'"  style='cursor:pointer;'>
								<td>${nlist.noticesid }</td>
								<td>${nlist.noticecontent }</td>
								<td>${nlist.noticeid }</td>
								<td>${nlist.registdate }</td>
								<td>${nlist.noticeview }</td>
							</tr>
						 </c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="paging" style="color: black; margin: auto; text-align: center;">
				<c:if test="${prev }">
					<a href="${pageContext.request.contextPath}/noticeBoard/${begin - 1}/">◀</a>
				</c:if>
				<c:forEach var="i" begin="${begin}" end="${end}">
				<c:if test="${i == page }">
					<strong>[${i }]</strong>
				</c:if>
				<c:if test="${i != page }">
					<a href="${pageContext.request.contextPath}/noticeBoard/${i }/">
				 		[${i }]
					</a>
				</c:if>
				</c:forEach>
				<c:if test="${next }">
					<a href="${pageContext.request.contextPath}/noticeBoard/${end + 1}/">▶</a>
				</c:if>
			</div>
			
			<c:if test="${session != null }">
				<div id="write" style="float: right;">
					<button  onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeWrite/'">글쓰기</button>
				</div>
			</c:if>
		</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>