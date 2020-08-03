<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="notice-content">
	<div class="notice_in">
		<form>
			<table class="table noticeRead">
				<thead>
					<tr align="center">
						<th>NUM</th>
						<td><input type="number" name="sid" value="${nData.noticesid }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly /></td>
						<th>작성날짜</th>
						<td><input type="text" name="registdate" value="${nData.registdate }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" readonly /></td>
						<th>조회수</th>
						<td><input type="number" name="view" value="${nData.noticeview }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly /></td>
					</tr>
					
					<tr>
						<th class="text-center">작성자</th>
						<td colspan="2"><input type="text" name="id" value="${nData.noticeid }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly /></td>
						<th class="text-center">GROUP</th>
						<td colspan="2">
							<select class="form-control" disable>
							  <option value="0" ${nData.noticetype == 0 ? 'selected' : nData.noticetype == 1 ? 'selected' : nData.noticetype == 2 ? 'selected' : ''}>가이드</option>
							  <option value="1" ${nData.noticetype == 0 ? 'selected' : nData.noticetype == 1 ? 'selected' : nData.noticetype == 2 ? 'selected' : ''}>24시</option>
							  <option value="2" ${nData.noticetype == 0 ? 'selected' : nData.noticetype == 1 ? 'selected' : nData.noticetype == 2 ? 'selected' : ''}>이벤트</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
						<td colspan="5"><input type="text" name="title" value="${nData.noticetitle}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" readonly /></td>
					</tr>
					
					<tr>
						<td colspan="6"><textarea rows="10" cols="136" readonly >${nData.noticecontent }</textarea></td>
					</tr>
					
					
					<c:if test="${user.userid eq nData.noticeid }">
						<tr>
							<td colspan="1 ml-auto">
								<input type="button" class="btn btn-outline-primary btn-w d-block ml-auto"
										onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeDelete/${nData.noticesid }/'"
											value="삭제" />
							</td>
							<td colspan="4 ml-auto"></td>
							<td colspan="1 ml-auto" style="width:100px;">		
								<input type="button" class="btn btn-outline-primary btn-w d-block ml-auto"
									onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeModify/${nData.noticesid }/'"
										value="수정" />	
							</td>
						</tr>
					</c:if>
				</thead>
			</table>
		</form>
	</div>
</section>