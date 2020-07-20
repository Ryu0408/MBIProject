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
	
    //마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
      var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
          contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
          markers = [], // 마커를 담을 배열입니다
          currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
          
   // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.17961286138595, 129.07550369966106), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var marker;

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

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

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

addrs = ['부산광역시 동구 망양로 533-3', '부산광역시 남구 진남로 135', '부산광역시 수영구 광안해변로 209', 
'부산광역시 부산진구 동천로 91-4', '부산광역시 중구 용미길10번길 1', '부산광역시 부산진구 당감동 가야대로 721'];
names = ['초량1941', '메그네이트', '카페오뜨', '넉아웃', 'Sel Roasters', '온 종합병원'];
store = ['약국', '식당', '카페', '약국', '약국', '병원'];

// 각 카테고리에 클릭 이벤트를 등록합니다

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

   displayPlaces(addrs);

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = 0;
//     var order = document.getElementById(currCategory).getAttribute('data-order');

//     for ( var i=0; i<places.length; i++ ) {
    addrs.forEach( function(addr, index) {
    	geocoder.addressSearch(addr, function(places, status) {
    		console.log(addr);
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(places[0].y, places[0].x);
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), places[0].y, places[0].x) < 100000) {
		            // 마커를 생성하고 지도에 표시합니다
		            marker = addMarker(new kakao.maps.LatLng(places[0].y, places[0].x), order);
		
		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[index]);
		 		}
			}
		});
    });
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' + '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>'
   				+ '    <span class="tel">' + place.phone + '</span>'
   				+ '</div>' 
   				+ '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}

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

// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
//     var category = document.getElementById('category'),
//         children = category.children;
		var category = document.querySelectorAll('.raun'),
			children = category;
    console.log(category);

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
      </script>

      <div class="btn-group d-flex" id="category">
	      <button type="button" class="btn btn-primary btn-lg raun" style="width: 80px;" data-order="0">식당</button>
	      <button type="button" class="btn btn-primary btn-lg raun" style="width: 80px;" data-order="1">약국</button>
	      <button type="button" class="btn btn-primary btn-lg raun" style="width: 80px;" data-order="2">카페</button>
	      <button type="button" class="btn btn-primary btn-lg raun" style="width: 80px;" data-order="3">병원</button>
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
         
<script type="text/javascript">
addCategoryClickEvent();

</script>
</body>
</html>