<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>

<section id="notice-content">
	<div class="notice_in">
		<form>
			<table class="table noticeRead">
				<thead>
					<tr>
						<th>NUM</th>
						<td><input type="number" name="sid" value="1" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
						<th>작성날짜</th>
						<td><input type="date" name="registdate" value="2020.07.10" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
						<th>조회수</th>
						<td><input type="number" name="view" value="2020.07.10" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
					</tr>
					
					<tr>
						<th class="text-center">작성자</th>
						<td colspan="2"><input type="text" name="id" value="홍길동" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
						<th class="text-center">GROUP</th>
						<td colspan="2">
							<select class="form-control">
							  <option value="0">항목1</option>
							  <option value="1" selected>항목2</option>
							  <option value="2">항목3</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
						<td colspan="5"><input type="text" name="title" value="공지사항 테스트 글 입니다~~" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
					</tr>
					
					<tr>
						<td colspan="6"><textarea rows="10" cols="136">공지사항 테스트!!! ~~~ </textarea></td>
					</tr>
					
					<tr>
						<td colspan="6">
							<span class="d-block w-100 text-right">
								<a href="${pageContext.request.contextPath }/noticeList/" target="_self"><input type="button" value="수정" class="btn btn-outline-primary btn-w d-inline-block ml-auto" /></a>
								<a href="${pageContext.request.contextPath }/noticeList/" target="_self"><input type="button" value="리스트" class="btn btn-outline-primary btn-w d-inline-block ml-auto" /></a>
							</span>
						</td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</section>