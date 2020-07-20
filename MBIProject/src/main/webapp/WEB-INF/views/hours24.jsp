<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<style>
	.card {
		display: inline-block;
	}
	article {		display: none;	} 
	article.on {	display: inline-block;	}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f208c8186518ea31e042273cb8e359d&libraries=services,clusterer,drawing"></script>
	
	<div id="map" style="text-align: center;height:400px;"></div>

<script>
	var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(35.17961286138595, 129.07550369966106), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  // 지도를 표시할 div 
    
    // 맵 생성(mapContainer는 div에 표실한 ID, mapOption은 지도 최초위치 및 지도확대레벨)
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    var levelj
    var latlngj
    
    //중심좌표
    kakao.maps.event.addListener(map, 'center_changed', function() {

        // 지도의  레벨을 얻어옵니다
        levelj = map.getLevel();

        // 지도의 중심좌표를 얻어옵니다 
        latlngj = map.getCenter(); 

        var message = '<p>지도 레벨은 ' + levelj + ' 이고</p>';
        message += '<p>중심 좌표는 위도 ' + latlngj.getLat() + ', 경도 ' + latlngj.getLng() + '입니다</p>';

        console.log(message);

    });
    
	 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    // 좌표를 찍기위한 marker 객체 생성
    var marker = new kakao.maps.Marker();
       	 
</script>
	<div class="btn-group d-flex">
		<button type="button" id="restaurant" class="btn btn-primary btn-lg raun" style="width: 80px;">식당</button>
		<button type="button" id="parmercy" class="btn btn-primary btn-lg raun" style="width: 80px;">약국</button>
		<button type="button" id="cafe" class="btn btn-primary btn-lg raun" style="width: 80px;">카페</button>
		<button type="button" id="hospital" class="btn btn-primary btn-lg raun" style="width: 80px;">병원</button>
	</div>
	
	<article id="restaurantArticle">
	    <div class="card text-white bg-primary mb-3" style="width: 20rem;">
	        <div class="card-body">
	            <h5 class="card-title">Primary card title</h5>
	            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
	        </div>
	    </div>
	    
	    <div class="card text-white bg-secondary mb-3" style="width: 20rem;">
	        <div class="card-body">
	            <h5 class="card-title">Secondary card title</h5>
	            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at.</p>
	        </div>
	    </div>
    </article>
    
    <article id="parmercyArticle">
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
    </article>
    
    <article id="cafeArticle">
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
    </article>
    
    <article id="hospitalArticle">
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
	</article>
	
<script>

// 버튼 쿼리 다 가져오기
btns = document.querySelectorAll('.raun');
// article 태그 가져오기
art = document.querySelectorAll('article');

var parmercyPositions = [];
var parmercyAddrs = [];
var parmercyNames = [];
var hospitalPositions = [];
var hospitalAddrs = [];
var cafePositions = [];
var restaurantPositions = [];
var placeOverlay = new kakao.maps.CustomOverlay();

var markerImageSrc = '${pageContext.request.contextPath }/img/markerimg.ico';
var parmercyMarkers = [];
var hospitalMarkers = [];
var cafeMarkers = [];
var restaurantMarkers = [];

//================================================================================================================================
btns.forEach( (bt) => {
	// 버튼눌렀을 시 
	bt.addEventListener('click', (event) => {
	    addrs = ['부산광역시 동구 망양로 533-3', '부산광역시 남구 진남로 135', '부산광역시 수영구 광안해변로 209', 
		'부산광역시 부산진구 동천로 91-4', '부산광역시 중구 용미길10번길 1', '부산광역시 부산진구 당감동 가야대로 721'];
		names = ['초량1941', '메그네이트', '카페오뜨', '넉아웃', 'Sel Roasters', '온 종합병원'];
		store = ['약국', '식당', '카페', '약국', '약국', '병원'];
		btns.forEach( (other) => { other.className = 'btn btn-primary btn-lg'; })
		event.target.className += ' on';		
		art.forEach( (other) => { other.className = ''; })
		document.getElementById(event.target.id + 'Article').className = 'on';
	 	addrs.forEach(function(addr, index) {
			if(bt.innerHTML === '약국'){
				if(store[index] === '약국'){
					geocoder.addressSearch(addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), result[0].y, result[0].x) < 100000) {
		    		 			parmercyPositions.push(new kakao.maps.LatLng(result[0].y,  result[0].x));
		    		 			parmercyAddrs.push(addrs[index]);
		    		 			parmercyNames.push(names[index]);
		    		 		}
		    			}
					});
				}
			}
		 	else if(bt.innerHTML === '식당'){
				if(store[index] === '식당'){
					geocoder.addressSearch(addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), result[0].y, result[0].x) < 100000) {
		    		 			restaurantPositions.push(new kakao.maps.LatLng(result[0].y,  result[0].x));
		    		 		}
		    			}
					});
				}
	    	}else if(bt.innerHTML === '카페'){
				if(store[index] === '카페'){
					geocoder.addressSearch(addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), result[0].y, result[0].x) < 100000) {
		    		 			cafePositions.push(new kakao.maps.LatLng(result[0].y,  result[0].x));
		    		 		}
		    			}
					});
				}
	    	}else if(bt.innerHTML === '병원'){
				if(store[index] === '병원'){
					geocoder.addressSearch(addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), result[0].y, result[0].x) < 100000) {
		    		 			hospitalPositions.push(new kakao.maps.LatLng(result[0].y,  result[0].x));
		    		 			hospitalAddrs.push(addrs[index]);
		    		 		}
		    			}
					});
				}
	    	}
	 	});
//================================================================================================================================
		createParmercyMarkers();
	    setParmercyMarkers(map);
	    
		createRestaurantMarkers();
		setRestaurantMarkers(map);
		
		createCafeMarkers();
		setCafeMarkers(map);
		
		createHospitalMarkers();
		setHospitalMarkers(map);
		
		setParmercyMarkers(null);
		setRestaurantMarkers(null);
		setCafeMarkers(null);
		setHospitalMarkers(null);

		if(bt.innerHTML === '약국'){
			createParmercyMarkers();
 	        setParmercyMarkers(map);
 	       	parmercyMarkers.forEach((marker) => {
				kakao.maps.event.addListener(marker, 'click', function() {
					if(placeOverlay.getContent()!== null){
	 				    placeOverlay.setMap(null);
					};
				    contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
				    var fullName = marker.getTitle();
				    var strArray = fullName.split("@");
 				    contentNode.innerHTML = "주소 : " + strArray[0] + "<br> 가게명 : " + strArray[1];

				    console.log("0번째배열(주소) :" + strArray[0] + "1번째배열(가게명) :" + strArray[1])
 				    placeOverlay.setPosition(new kakao.maps.LatLng(marker.getPosition().Ha, marker.getPosition().Ga));
    				placeOverlay.setContent(contentNode);
 				    placeOverlay.setMap(map);
				});
			});
		}else if(bt.innerHTML === '식당'){
			createRestaurantMarkers();
			setRestaurantMarkers(map);
		}else if(bt.innerHTML === '카페'){
			createCafeMarkers();
			setCafeMarkers(map);
    	}else if(bt.innerHTML === '병원'){
			createHospitalMarkers();
			setHospitalMarkers(map);
			hospitalMarkers.forEach((marker) => {
				kakao.maps.event.addListener(marker, 'click', function() {
					if(placeOverlay.getContent()!== null){
	 				    placeOverlay.setMap(null);
					};
				    contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
				    contentNode.innerHTML = marker.getTitle();
 				    placeOverlay.setPosition(new kakao.maps.LatLng(marker.getPosition().Ha, marker.getPosition().Ga));
    				placeOverlay.setContent(contentNode);
 				    placeOverlay.setMap(map);
				});
			});
    	}
	});
});
//================================================================================================================================
//x,y좌표값을 받아서 2키로 이내 좌표인지 확인해주는 함수(단위 미터)
function calcDistance(cenLat, cenLng, y, x) {
	var theta = cenLng - x;
	dist = Math.sin(deg2rad(cenLat)) * Math.sin(deg2rad(y)) 
		+ Math.cos(deg2rad(cenLat)) * Math.cos(deg2rad(y)) * Math.cos(deg2rad(theta));
	dist = Math.acos(dist);
	dist = rad2deg(dist);
	dist = dist * 60 * 1.1515;
	dist = dist * 1.609344;
	return Number(dist * 1000).toFixed(2);
}

// calcDistance의 각도계산을 위한 함수
function deg2rad(deg) {
	return (deg * Math.PI / 180);
}

// calcDistance의 radian을 위한 함수
function rad2deg(rad) {
	return (rad * 180 / Math.PI);
}
//================================================================================================================================
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

function createMarker(position, image, title) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image,
        title:title
    });
    return marker;  
}   
//================================================================================================================================
function setParmercyMarkers(map) {        
    for (var i = 0; i < parmercyPositions.length; i++) {  
    	parmercyMarkers[i].setMap(map);
    }        
}

function createParmercyMarkers() {
    for (var i = 0; i < parmercyPositions.length; i++) {  
        var imageSize =  new kakao.maps.Size(31, 35);
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(parmercyPositions[i], markerImage, parmercyAddrs[i]+"@"+parmercyNames[i]);  
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        parmercyMarkers.push(marker);
        
    }     
}
//================================================================================================================================
function setRestaurantMarkers(map) {        
    for (var i = 0; i < restaurantPositions.length; i++) {  
    	restaurantMarkers[i].setMap(map);
    }        
}

function createRestaurantMarkers() {
    for (var i = 0; i < restaurantPositions.length; i++) {  
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(restaurantPositions[i], markerImage, restaurantAddrs[i]);  
       
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        restaurantMarkers.push(marker);
    }     
}
//================================================================================================================================
function setCafeMarkers(map) {        
    for (var i = 0; i < cafePositions.length; i++) {  
    	cafeMarkers[i].setMap(map);
    }        
}

function createCafeMarkers() {
    for (var i = 0; i < cafePositions.length; i++) {  
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(cafePositions[i], markerImage, cafeAddrs[i]);  
       
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        cafeMarkers.push(marker);
    }     
}
//================================================================================================================================
function setHospitalMarkers(map) {        
    for (var i = 0; i < hospitalPositions.length; i++) {  
    	hospitalMarkers[i].setMap(map);
    }        
}

function createHospitalMarkers() {
    for (var i = 0; i < hospitalPositions.length; i++) {  
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
        
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(hospitalPositions[i], markerImage, hospitalAddrs[i]);  
       
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        hospitalMarkers.push(marker);
    }     
}
//================================================================================================================================

</script>



