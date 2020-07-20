<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/board.css"/>
<section style="height: 800px; clear: both;">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-black" style="margin-top: 50px;">
<section id="notice-content">
	<div class="notice_in">
		<form method="POST" action="${pageContext.request.contextPath }/guideBoard/writeBoard/" >
			<table class="table noticeWrite">
				<thead>
					<tr>
						<th class="text-center">작성자</th>
						<td><input type="text" name="boardid" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
						<th class="text-center">카테고리</th>
						<td>
							<select name="boardtype" class="form-control form-control-sm notice-group">
							  <option value="0">관광지</option>
							  <option value="1">맛집</option>
							  <option value="2">지역행사</option>
							</select>
						</td>
<!-- 						<th class="text-center">조회수</th> -->
<!-- 						<td><input type="text" name="view" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" style="width: 20px;" readOnly/></td> -->
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
							<td colspan="3">
								<input type="text" name="boardtitle" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required
								 onfocus="this.placeholder=''"onblur="this.placeholder='글제목을 입력해주세요. (최대 50자)'" placeholder="글제목을 입력해주세요. (최대 50자)">${vo.boardtitle }</td>
<!-- 							<th class="text-center">좋아요</th> -->
<!-- 						<td><input type="text" name="good" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" style="width: 20px;" readOnly/></td> -->
					</tr>
					<!--글내용 -->
					<tr>
						<td colspan="6"><textarea rows="10" cols="136" name="boardcontent"
						onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요. (최대 1000자)'" placeholder="내용을 입력해주세요. (최대 1000자)" style="resize: none;">}</textarea></td>
					</tr>
					<tr>
						<td colspan="6 ml-auto"><input type="submit" class="btn btn-outline-primary btn-w d-block ml-auto" /></td>
					</tr>
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