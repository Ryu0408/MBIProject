<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						style="margin-top: 20px;">관광지</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="margin-top: 20px;">맛집</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						style="margin-top: 20px;">지역행사</a></li>
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
						<tr>
							<td>1</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>2</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>3</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>3</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>4</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>5</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>6</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>7</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>8</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>9</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>
						<tr>
							<td>10</td>
							<td>부산 동래구맛집 서창재식당에 다녀오다</td>
							<td>ckdwo3259@gmail.com</td>
							<td>2000</td>
							<td>500</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div id="write" style="float: right;">
				<button onclick="location.href='${pageContext.request.contextPath}/guideBoard/writeBoard/'">글쓰기</button>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>