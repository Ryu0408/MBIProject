<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<section style="height: 800px; clear: both;">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 text-black" style="margin-top: 50px;">
			<div class="content" style="border: 1px solid; padding: 50px; height: 650px;">
				<form action="writerAction" method="post">
					<input type="hidden" name="bdGroup" value="아">
					<input type="hidden" name="bdOrder" value="에">
					<input type="hidden" name="bdIndent" value="이">
					<div id="userinfo">
						<input type="text" name="boardID" class="form-control mt-4 mb-2" placeholder="아이디을 입력해주세요.">
						<input type="text" name="boardID" class="form-control mt-4 mb-2" placeholder="아이디을 입력해주세요.">			
					</div>
					<input type="text" name="boardTitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
					<div class="form-group">
						<textarea class="form-control" rows="10" name="boardContents" placeholder="내용을 입력해주세요" required style="resize: none;"> </textarea>
					</div>
					<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
				</form>
				</div>
			</div>
		<div class="col-sm-2"></div>
	</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>