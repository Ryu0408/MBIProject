<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map API</title>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<style>
	.card {
		display: inline-block;
	}
	
</style>
<div id="map" style="text-align: center;height:400px;"></div>
<!--    <script type="text/javascript" -->
<!--       src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f208c8186518ea31e042273cb8e359d"></script> -->
      <!-- services 라이브러리 불러오기 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f208c8186518ea31e042273cb8e359d&libraries=services"></script> -->
      <!-- services(장소검색)와 clusterer(주소좌표 변환), drawing(지도위 마커) 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f208c8186518ea31e042273cb8e359d&libraries=services,clusterer,drawing"></script>
      <!--지도를 담을 영역의 DOM 레퍼런스  -->
      <script>
//       var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
//       var options = { //지도를 생성할 때 필요한 기본 옵션
//          center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
//          level: 3 //지도의 레벨(확대, 축소 정도)
//        };
//       var map = new kakao.maps.Map(container, options);
      
   // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('부산광역시 해운대구 센텀2로 25', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">MBI Project building</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
      </script>

 

      <div class="btn-group d-flex">
		<button type="button" class="btn btn-primary btn-lg" style="width: 80px;">식당</button>
		<button type="button" class="btn btn-primary btn-lg" style="width: 80px;">약국</button>
		<button type="button" class="btn btn-primary btn-lg" style="width: 80px;">카페</button>
		<button type="button" class="btn btn-primary btn-lg" style="width: 80px;">병원</button>
		</div>
		
		<div class="bs-example">
    <div class="card text-white bg-primary mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Primary card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    </div>
    
    <div class="card text-white bg-secondary mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Secondary card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    
    <div class="card text-white bg-success mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Success card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    <div class="card text-white bg-danger mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Danger card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    <div class="card text-white bg-warning mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Warning card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    <div class="card text-white bg-info mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Info card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    <div class="card bg-light mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Light card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
    <div class="card text-white bg-dark mb-3" style="width: 20rem;">
        <div class="card-body">
            <h5 class="card-title">Dark card title</h5>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
        </div>
    </div>
</div>
			
	
</body>
</html>