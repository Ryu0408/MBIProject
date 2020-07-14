<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/notice.css"/>

<section id="notice-content">
	<div class="notice_in">
		<form>
			<select class="form-control form-control-sm notice-group clearfix">
			  <option value="0">항목1</option>
			  <option value="1">항목2</option>
			  <option value="2">항목3</option>
			</select>
		</form>
		
		<table class="notice text-center">
			<tr>
				<th>번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#" target="_self">장소의 위치를 알고 싶어요.~~</a></td>
				<td>아방가르드</td>
				<td>2020.07.10</td>
				<td>10</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#" target="_self">장소의 위치를 알고 싶어요.~~</a></td>
				<td>아방가르드</td>
				<td>2020.07.10</td>
				<td>10</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#" target="_self">장소의 위치를 알고 싶어요.~~</a></td>
				<td>아방가르드</td>
				<td>2020.07.10</td>
				<td>10</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#" target="_self">장소의 위치를 알고 싶어요.~~</a></td>
				<td>아방가르드</td>
				<td>2020.07.10</td>
				<td>10</td>
			</tr>
			
			<tr>
				<td>1</td>
				<td><a href="#" target="_self">장소의 위치를 알고 싶어요.~~</a></td>
				<td>아방가르드</td>
				<td>2020.07.10</td>
				<td>10</td>
			</tr>
		</table>
		
		<div class="btnGroup w-100">
	    	<a href="${pageContext.request.contextPath }/noticeWrite/" class="ml-auto btn btn-secondary btn-lg disabled" tabindex="-1" role="button" aria-disabled="true">글쓰기</a>
	    </div>
		
		<nav class="navi" aria-label="Page navigation">
		  <ul class="pagination">
		    <li class="page-item">
			    <a class="page-link" href="#">
				    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
					  <path fill-rule="evenodd" d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
					  <path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z"/>
					</svg>
				</a>
			</li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		    	<a class="page-link" href="#">
		    		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>.
					  <path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
					  <path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
					</svg>
		    	</a>
		    </li>
		  </ul>
		</nav>
	</div>
</section>
