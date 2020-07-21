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
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo_wrap .after {content:'';
	position:relative;
	margin-left:-12px;
	left:50%;width:22px;
	height:12px;
	background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
	}
	.placeinfo {
	position:relative; 
	width:100%; 
	border-radius:6px; 
	border: 1px solid #ccc; 
	border-bottom:2px solid #ddd; 
	padding-bottom: 10px; 
	background: #fff;
	}
	.placeinfo span {display: block; 
	text-overflow: ellipsis; 
	overflow: hidden; 
	white-space: nowrap; 
	margin:5px 5px 0 5px; 
	cursor: default; 
	font-size:13px;
	}
	.placeinfo .title {font-weight: bold; 
	font-size:14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding:10px; 
	color: #fff;
	background: #d95050;
	background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
	}
	.placeinfo .tel {color:#0f7833;}
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
	
	
	<div class="btn-group d-flex">
		<button type="button" id="restaurant" class="btn btn-primary btn-lg search" style="width: 80px;">현재위치에서찾기</button>
	</div>
<script>

// 버튼 쿼리 다 가져오기
btns = document.querySelectorAll('.raun');
search = document.querySelectorAll('.search');
// article 태그 가져오기
// art = document.querySelectorAll('article');


	

var addrs = [];
var names = [];
var phones = [];
var rates = [];
var types = [];
<c:forEach items="${list}" var = "hvo" varStatus="index">
	addrs.push("${hvo.storeAddr}");
	names.push("${hvo.storeName}");
	phones.push("${hvo.storePhone}");
	rates.push("${hvo.storeRate}");
	types.push("${hvo.storeType}");
</c:forEach>
var parmercyPositions = [];
var parmercyAddrs = [];
var parmercyNames = [];
var parmercyPhones = [];
var parmercyRates = [];
var hospitalPositions = [];
var hospitalAddrs = [];
var cafePositions = [];
var restaurantPositions = [];
var placeOverlay = new kakao.maps.CustomOverlay();

var markerImageSrc = '${pageContext.request.contextPath }/img/image4.png';
var parmercyMarkers = [];
var hospitalMarkers = [];
var cafeMarkers = [];
var restaurantMarkers = [];
var btset;

var imageSize =  new kakao.maps.Size(50, 36);
var imageOptions = {  
    spriteOrigin: new kakao.maps.Point(10, 0),    
    spriteSize: new kakao.maps.Size(43, 36)  
};  
var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);   

btns.forEach( (bt) => {
	// 버튼눌렀을 시 
	bt.addEventListener('click', (event) => {
		btns.forEach( (other) => { other.className = 'btn btn-primary btn-lg'; })
		event.target.className += ' on';		
	 	addrs.forEach(function(addr, index) {
			if(bt.innerHTML === '약국'){
				if(types[index] === '0'){
					btset = bt;
					geocoder.addressSearch(addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    		 		parmercyPositions.push(new kakao.maps.LatLng(result[0].y,  result[0].x));
			    		 	parmercyAddrs.push(addrs[index]);
			    		 	parmercyNames.push(names[index]);
			    		 	parmercyPhones.push(phones[index]);
			    		 	parmercyRates.push(rates[index]);
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
	});

});


search.forEach( (sc) => {
	sc.addEventListener('click', (event) => {
		if(btset.innerHTML === '약국'){
			console.log(parmercyMarkers[0]);
			if(parmercyMarkers[0] !== undefined){
				setParmercyMarkers(null);
			    placeOverlay.setMap(null);
				parmercyMarkers = [];
			}
			for(i=0;i<parmercyPositions.length;i++){
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), parmercyPositions[i].getLat(), parmercyPositions[i].getLng()) < 2000) {
		            marker = createMarker(parmercyPositions[i], markerImage, parmercyNames[i]+"@"+parmercyAddrs[i]+"@"+parmercyPhones[i]+"@"+parmercyRates[i]);  
			        // 생성된 마커를 커피숍 마커 배열에 추가합니다
			        parmercyMarkers.push(marker);
			        console.log("if문 실행");
		 		}
			}
			setParmercyMarkers(map);
			parmercyMarkers.forEach((marker) => {
				console.log("marker 실행");
				kakao.maps.event.addListener(marker, 'click', function() {
					if(placeOverlay.getContent()!== null){
						    placeOverlay.setMap(null);
					};
				    contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
				  //커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
				    contentNode.className = 'placeinfo_wrap';
				    var fullName = marker.getTitle();
				    var strArray = fullName.split("@");
				    var content = '<div class="placeinfo">' + strArray[0]
				    		+ '    <span title="' + strArray[1] + '">' + strArray[1] + '</span>' 
				    		+ '    <span class="tel">' + strArray[2] + '</span>'
				    		+ '    <span class="rate">' + strArray[3] + '</span>' + '</div>'
				    		+ '<div class="after"></div>';
				
				    contentNode.innerHTML = content;
//					    contentNode.innerHTML = "가게명 : " + strArray[0] + "<br> 주소 : " + strArray[1];
//					    contentNode.innerHTML = "번호 : " + strArray[2] + "<br> 평점 : " + strArray[3];

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
    for (var i = 0; i < parmercyMarkers.length; i++) {  
    	parmercyMarkers[i].setMap(map);
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



