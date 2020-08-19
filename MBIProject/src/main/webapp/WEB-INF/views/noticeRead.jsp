<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
   function response_del(sid){
	 let chk = confirm("삭제하시겠습니까?");
	 if(chk){
		 location.href = '${pageContext.request.contextPath}/noticeBoard/noticeDelete/'+sid+'/';
	 }
   }
</script>
<section id="notice-content">
	<div class="notice_in">
		<form>
			<table class="table noticeRead">
				<thead>
					<tr align="center">
						<th>NUM</th>
						<td><input type="number" name="sid" value="${nData.noticesid }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly="readonly" /></td>
						<th>작성날짜</th>
						<td><input type="text" name="registdate" value="${nData.registdate }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" readonly="readonly" /></td>
						<th>조회수</th>
						<td><input type="number" name="view" value="${nData.noticeview }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly="readonly" /></td>
					</tr>
					
					<tr>
						<th class="text-center">작성자</th>
						<td colspan="2"><input type="text" name="id" value="${nData.noticeid }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"  readonly="readonly" /></td>
						<th class="text-center">GROUP</th>
						<td colspan="2">
							<input type="text" name="boardtype"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-sm" value="${nData.noticetype == 0 ? '공지사항' : nData.noticetype == 1 ? '공모전' : nData.noticetype == 2 ? '이벤트' : ''}" readonly="readonly" >
						</td>
					</tr>
					
					<tr>
						<th class="text-center">글제목</th>
						<td colspan="5"><input type="text" name="title" value="${nData.noticetitle}" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" readonly="readonly"y /></td>
					</tr>
					
					<tr>
						<td colspan="6"><textarea rows="10" cols="136" readonly >${nData.noticecontent }</textarea></td>
					</tr>
					
					<c:choose>
						<c:when test="${user.userid eq 'admin@admin.com' }">
							<tr>
								<td colspan="1 ml-auto">
									<input type="button" class="btn btn-outline-primary btn-w d-block ml-auto"
											onclick="response_del(${nData.noticesid })"
												value="삭제" />
								</td>
								
								<td colspan="4 ml-auto"></td>
								<td colspan="1 ml-auto" style="width:100px;">		
								<input type="button" class="btn btn-outline-primary btn-w d-block ml-auto"
									onclick="location.href='${pageContext.request.contextPath}/noticeBoard/noticeModify/${nData.noticesid }/'"
										value="수정" />	
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">
									<input type="button" class="btn btn-outline-primary btn-w d-block ml-auto"
										onclick = 'history.go(-1)'
										value="목록" />
								</td>	
							</tr>
						</c:otherwise>
					</c:choose>
					
				</thead>
			</table>
		</form>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>