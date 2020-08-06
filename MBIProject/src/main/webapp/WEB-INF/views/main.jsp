<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  Header Include -->
<jsp:include page="header.jsp"/>
<style>
ul li {display:inline-block; list-style:none; font-size:12pt;}
a {text-decoration:none; color:black;}
a:hover {text-decoration:none; color:black; }
</style>
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
        var temp =  Math.floor((resp.main.temp- 273.15));
        document.getElementById("temp").innerHTML= temp + "℃";
        console.log("현재습도 : "+ resp.main.humidity);
        var humidity =  resp.main.humidity
        document.getElementById("humidity").innerHTML= "현재습도(" + humidity + ")";
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
		<div class="col-sm-8">
			<img src="/homepage/img/광안대교8.jpg" style="height:300px; width: 1280px">
		</div>
	<div class="col-sm-2"></div>
</div><br>

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
	<div class="col-sm-2">
	<center>
		<h5>이달의 추천</h5>
		<a><img src="${pageContext.request.contextPath }/img/donggas.jpg" style="width:300px; height: 90px"></a><br><br>
		<a><img src="${pageContext.request.contextPath }/img/donggas.jpg" style="width:300px; height: 90px"></a>
	</center>
	</div>
	<div class="col-sm-2">
		<center>
		<img id = "weather"  style="width:60px; height: 90px">
		<b id = "temp" style="font-size: 40pt"></b><br>
		<b id = "humidity" style="font-size: 20pt"></b>
		</center>
	</div>
	<div class="col-sm-2"></div>
</div>
<br>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<div class="container" style="padding:0px; margin: 0px;">
<!-- 			Nav pills -->
  			<ul class="nav nav-pills" role="tablist">
    			<li class="nav-item" style="width:100px; text-align:center;">
      				<a class="nav-link active" data-toggle="pill" href="#notice">공지사항</a>
   				 </li>
    			<li class="nav-item" style="width:100px; text-align:center;">
      				<a class="nav-link" data-toggle="pill" href="#guide">가이드</a>
    			</li>
    			<li class="nav-item" style="width:100px; text-align:center;">
      				<a class="nav-link" data-toggle="pill" href="#hour24">24시정보</a>
    			</li>
    			<li class="nav-item" style="width:100px; text-align:center;">
      				<a class="nav-link" data-toggle="pill" href="#review">리뷰</a>
    			</li>
  			</ul>
<!-- 		 	Tab panes -->
		 	<hr style="margin-top:0px; border:0.5px solid #007bff; width:1220px;">
  			<div class="tab-content" style = "height : 240px; width : 1273px;">
    			<div id="notice" class="container tab-pane active" style = "margin:0px; padding: 0px; max-width:1300px;">
    				<div style="width: 280px; margin-right:40px; float: left;">
						<h5><b>부산광역시 공지사항1</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>   
    				</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 공지사항2</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 공지사항3</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
					<div style="width: 280px; float: left;">
						<h5><b>부산광역시 공지사항4</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    			</div>
    			<div id="guide" class="container tab-pane" style = "margin:0px; padding: 0px; max-width:1300px;">
    				<div style="width: 280px; margin-right:40px; float: left;">
						<h5><b>부산광역시 가이드1</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>   
    				</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 가이드2</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 가이드3</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
					<div style="width: 280px; float: left;">
						<h5><b>부산광역시 가이드4</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    			</div>
    			<div id="hour24" class="container tab-pane" style = "margin:0px; padding: 0px; max-width:1300px;">
    				<div style="width: 280px; margin-right:40px; float: left;">
						<h5><b>부산광역시 24시정보1</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>   
    				</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 24시정보2</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 24시정보3</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
					<div style="width: 280px; float: left;">
						<h5><b>부산광역시 24시정보4</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    			</div>
    			<div id="review" class="container tab-pane" style = "margin:0px; padding: 0px; max-width:1300px;">
    				<div style="width: 280px; margin-right:40px; float: left;">
						<h5><b>부산광역시 리뷰1</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>   
    				</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 리뷰2</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px; width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    				<div style="width: 280px; float: left; margin-right:40px;">
						<h5><b>부산광역시 리뷰3</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
					<div style="width: 280px; float: left;">
						<h5><b>부산광역시 리뷰4</b></h5>
      					<div class="jumbotron" style="padding: 2px; margin:0px; width: 260px; height:130px;">
							<p style = "font-size: 15px; margin:0px;">코로나19로 취업에 어려움을 겪고 있는 시민들에게 한시적인 공공일자리를 제공하고 지역경제 회복을 위하여 부산광역시 “코로나19 극복 희망일자리사업” 참여자를 모집합니다.</p>
						</div>
      					<div class="jumbotron" style="padding: 2px; padding-right:20px; margin:0px;width: 260px; height:30px;">
							<p style = "text-align: right;">2020-07-14</p>
						</div>
					</div>
    			</div>
  			</div>
		</div>
	</div>
	<div class="col-sm-2">
	</div>
	<div class="col-sm-2"></div>
	<div class="col-sm-8" style="background-color:#f5f5f5; margin-top:60px; padding:30px 0px;">
		<ul style="padding-left:65px;">
			<li style="width:230px;">
				<a href="http://www.busan.go.kr/expo/index" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-globe-earth-96.png" style="height:70px; width:70px"></span>
				<span>2030부산월드엑스포</span>
				</a>
			</li>
			<li style="width:190px;">
				<a href="http://lifemap.busan.go.kr/" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-region-96.png" style="height:70px; width:70px"></span>
				<span>부산생활지도</span>
				</a>
			</li>
			<li style="width:210px;">
				<a href="http://www.busan.go.kr/young/index" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-commercial-96.png" style="height:70px; width:70px"></span>
				<span>부산청년플랫폼</span>
				</a>
			</li>
			<li style="width:180px;">
				<a href="http://www.busan.go.kr/jumin" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-handshake-96.png" style="height:70px; width:70px"></span>
				<span>주민자치회</span>
				</a>
			</li>
			<li style="width:160px;">
				<a href="https://www.busan.go.kr/minwon/guide" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-siren-96.png" style="height:70px; width:70px"></span>
				<span>신고센터</span>
				</a>
			</li>
			<li style="width:190px;">
				<a href="http://www.safetyreport.go.kr/" target="_blank" title="새창열기">
				<span><img src="/homepage/img/icons8-user-shield-96.png" style="height:70px; width:70px"></span>
				<span>안전신문고</span>
				</a>
			</li>
		</ul>
	</div>
	<div class="col-sm-2"></div>
</div>

<!-- Footer Include -->

<jsp:include page="footer.jsp"/>
</body>
</html>