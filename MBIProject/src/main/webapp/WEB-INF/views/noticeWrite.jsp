<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>
<section id="notice-content">
	<div class="notice_in">
		<form method="POST" >
			<table class="table noticeWrite">
				<thead>
					<tr>
						<th class="text-center">작성자</th>
						<td><input type="text" name="id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
						<th class="text-center">GROUP</th>
						<td>
							<select class="form-control form-control-sm notice-group">
							  <option value="0">항목1</option>
							  <option value="1">항목2</option>
							  <option value="2">항목3</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
						<td colspan="3"><input type="text" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
					</tr>
					
					<tr>
						<td colspan="4"><textarea rows="10" cols="136"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="4 ml-auto"><input type="submit" class="btn btn-outline-primary btn-w d-block ml-auto" /></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</section>