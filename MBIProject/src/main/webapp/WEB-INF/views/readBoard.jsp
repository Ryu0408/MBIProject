<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/board.css" />
<script>
	function del(boardsid){
		var chk = confirm("정말 삭제하시겠습니까?")
		console.log("실행이 됩니까?")
		console.log(boardsid)
		if(chk){
			location.href = '${pageContext.request.contextPath }/guideBoard/readBoard/delete/'+boardsid+'/';
		}
// 		    response.sendRedirect("${pageContext.request.contextPath }/guideBoard/")
// 		    console.log("111")
// 		    history.go(-1)
// 		location.href = '${pageContext.request.contextPath }/guideBoard/'
	}
</script>

<!-- 디테일에서 좋아요를 누르면 좋아요버튼이 클릭되어 db에 1저장 -->
<section style="height: 800px; clear: both;">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-black" style="margin-top: 50px;">
			<section id="notice-content">
				<div class="notice_in">
					<form method="POST">
					 	<input type="hidden" name="boardsid" value="${gvo.boardsid }">
						<table class="table noticeWrite">
							<thead>
								<tr>
									<th class="text-center">작성자</th>
									<td><input type="text" name="boardid" class="form-control"
										aria-label="Sizing example input"
										aria-describedby="inputGroup-sizing-sm"
										value=" ${gvo.boardid}" readOnly /></td>
									<th class="text-center">카테고리</th>
									<td><input type="text" name="boardtype"
										class="form-control" aria-label="Sizing example input"
										aria-describedby="inputGroup-sizing-sm" value="${gvo.boardtype }" readonly style="width: 100px;">
									</td>
									<th class="text-center">조회수</th>
									<td>${gvo.boardview}</td>
								</tr>
								<!-- 세션이 있으면 수정삭제 보여주고 없으면 안보여죽 -->

								<tr>
									<th class="text-center">글제목</th>
									<td colspan="3"><input type="text" name="boardtitle"
										class="form-control" aria-label="Sizing example input"
										aria-describedby="inputGroup-sizing-sm" required
										onfocus="this.placeholder=''"
										onblur="this.placeholder='글제목을 입력해주세요. (최대 50자)'"
										placeholder="글제목을 입력해주세요. (최대 50자)" value="${gvo.boardtitle}" readonly></td>
									<th class="text-center">좋아요</th>
									<td>${gvo.boardgood}</td>
								</tr>
								<!--글내용 -->
								<tr>
									<td colspan="6"><textarea rows="10" cols="136" name="boardcontent"
											onfocus="this.placeholder=''"
											onblur="this.placeholder='내용을 입력해주세요. (최대 1000자)'"
											placeholder="내용을 입력해주세요. (최대 1000자)" readonly style="resize: none;" >${gvo.boardcontent} </textarea></td>
								</tr>
								<c:if test="${userSession.userid == gvo.boardid}">
									<tr>
										<td colspan="1 ml-auto"><button type = "button"
											class="btn btn-outline-primary btn-w d-block ml-auto"
											onclick="del(${gvo.boardsid})"
											>삭제</button></td>
										<td colspan="4 ml-auto">
										<td colspan="1 ml-auto"><input type="button"
											class="btn btn-outline-primary btn-w d-block ml-auto"
											onclick="location.href='${pageContext.request.contextPath}/guideBoard/updateBoard/${gvo.boardsid }/'"
											value="수정" /></td>
									</tr>
								</c:if>
								<c:if test="${userSession.username == null}">
									<tr>
									</tr>
								</c:if>
							</thead>
						</table>
					</form>
				</div>
			</section>
		</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>