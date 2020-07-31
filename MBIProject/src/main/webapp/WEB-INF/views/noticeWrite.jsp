<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>
<section id="notice-content">
	<div class="notice_in">
		<form method="POST" >
			<table class="table noticeWrite">
				<thead>
					<tr>
						<th class="text-center">작성자</th>
						<c:if test="${user.userid != null}">
							<td><input type="text" name="noticeid" value="${user.userid }"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly /></td>
						</c:if>
						<th class="text-center">GROUP</th>
						<td>
							<select name="noticetype" class="form-control form-control-sm notice-group">
							  <option value="0" >가이드</option>
							  <option value="1">24시</option>
							  <option value="2">이벤트</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
						<td colspan="3"><input type="text" name="noticetitle" class="noticetitle form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
					</tr>
					
					<tr>
						<td colspan="4"><textarea name="noticecontent" rows="10" cols="136" name="boardcontent"
						onfocus="this.placeholder=''" onblur="this.placeholder='내용을 입력해주세요. (최대 1000자)'" placeholder="내용을 입력해주세요. (최대 1000자)" style="resize: none;"></textarea></textarea></td>
					</tr>
					
					<tr>
						<td colspan="4 ml-auto"><input type="submit" class="btn btn-outline-primary btn-w d-block ml-auto" /></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</section>