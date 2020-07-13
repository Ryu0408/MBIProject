<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<section style = "height : 800px; clear : both;">
<div class="row">
  	<div class="col-sm-2"></div>
	<div class="col-sm-2 bg-info text-white" >
		<nav class="navbar bg-light">
		  <ul class="navbar-nav">
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link 1</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link 2</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">Link 3</a>
		    </li>
		  </ul>
		</nav>
	</div>
	<div class="col-sm-6 bg-info text-white" >
		<div class="content" style="border: 1px solid; margin-left: 30px;">
			<p>컨텐츠</p>
		</div>
	</div>
  <div class="col-sm-2"></div>
</div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>