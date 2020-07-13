<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  Header Include -->
<jsp:include page="header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Busan&appid=8e270d5d20879442caf9b0de7496e703";
	$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {
        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
        console.log("현재습도 : "+ resp.main.humidity);
        console.log("날씨 : "+ resp.weather[0].main );
        var weather =  resp.weather[0].main;
        document.getElementById("weather").src="${pageContext.request.contextPath }/img/" + weather +".png";
        console.log("상세날씨설명 : "+ resp.weather[0].description );
        console.log("날씨 이미지 : "+ resp.weather[0].icon );
        console.log("바람   : "+ resp.wind.speed );
        console.log("나라   : "+ resp.sys.country );
        console.log("도시이름  : "+ resp.name );
        console.log("구름  : "+ (resp.clouds.all) +"%" );                 
    }
	})
</script>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-4">
		<div id="demo" class="carousel slide" data-ride="carousel">
  		<!-- Indicators -->
  			<ul class="carousel-indicators">
    			<li data-target="#demo" data-slide-to="0" class="active"></li>
    			<li data-target="#demo" data-slide-to="1"></li>
    			<li data-target="#demo" data-slide-to="2"></li>
  			</ul>
  			<!-- The slideshow -->
  			<div class="carousel-inner">
    			<div class="carousel-item active">
      				<img src="https://www.busan.go.kr/imgBANNER/20200507/050709B4417502-89e6cebcd94e4d18ae5bc648880a2f7d.jpg"  width="600" height="250">
    			</div>
    			<div class="carousel-item">
      				<img src=https://www.busan.go.kr/imgBANNER/20191230/123016B3821707-d01b756c558d47779dcb0fe306c99409.jpg width="600" height="250">
    			</div>
    			<div class="carousel-item">
      				<img src="https://museum.busan.go.kr/comm/getImage?srvcId=DSPYBBS&upperNo=309&fileTy=ATTACH&fileNo=2" width="600" height="250">
    			</div>
  			</div>
  			 <!-- Left and right controls -->
  			<a class="carousel-control-prev" href="#demo" data-slide="prev">
    			<span class="carousel-control-prev-icon" style ="color: black"></span>
  			</a>
  			<a class="carousel-control-next" href="#demo" data-slide="next">
    			<span class="carousel-control-next-icon"></span>
  			</a>
		</div>
	</div>
	<div class="col-sm-2" style="border-right-style:solid; border-right-color: gray">
	<center>
		<h5>이달의 추천</h5>
		<a><img src="https://lh3.googleusercontent.com/proxy/MJ6W422Y3pRzUkXOCROt721vRPfTT3GyhE12KaL9a3N6WEpXLNFTiuGtLo2F03S7riG6gqXh1mv3uBEoPcJFPoEMVl-mNxUdOlPBIqcD1f2sZ0t5ywflLaBrEAJDF9KUy_gh66syUT0uVorbGGPsfChjYhCyq71E1xt_Uw" style="width:300px; height: 90px"></a><br><br>
		<a><img src="https://lh3.googleusercontent.com/proxy/MJ6W422Y3pRzUkXOCROt721vRPfTT3GyhE12KaL9a3N6WEpXLNFTiuGtLo2F03S7riG6gqXh1mv3uBEoPcJFPoEMVl-mNxUdOlPBIqcD1f2sZ0t5ywflLaBrEAJDF9KUy_gh66syUT0uVorbGGPsfChjYhCyq71E1xt_Uw" style="width:300px; height: 90px"></a>
	</center>
	</div>
		<h5>오늘의 부산날씨</h5><br>
		<img id = "weather"  style="width:50px; height: 90px">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-2"></div>
</div>

<!-- Footer Include -->

<jsp:include page="footer.jsp"/>
</body>
</html>