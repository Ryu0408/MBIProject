<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<style>
	.card {	display: inline-block;	}
	article {		display: none;	} 
	article.on {	display: inline-block;	}
	div.off { display: none; }
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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f208c8186518ea31e042273cb8e359d&libraries=services,clusterer,drawing"></script>
	<hr>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<a href="${pageContext.request.contextPath }/">
			<span><img src="${pageContext.request.contextPath }/img/icons8-home-96.png" style="height:30px; width:30px"></span>
			</a>
			<span> > </span>
			<a href="${pageContext.request.contextPath }/hours24/" style="text-decoration:none; color:black;">
			<span> 24시정보 </span>
			</a>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<hr>
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


    });
    
	 // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    // 좌표를 찍기위한 marker 객체 생성
    var marker = new kakao.maps.Marker();
    
    var storeArray = new Array();
    var parmercyArray = new Array();
    var hospitalArray = new Array();
    var cafeArray = new Array();
    var restaurantArray = new Array();
    var restaurantCount = 0;
    var parmercyCount = 0;
    var hospitalCount = 0;
    var cafeCount = 0;
    var perPage = 12;
    <c:forEach items="${list}" var = "hvo" varStatus="index">
    	var store = new Object();
    	store.addr = "${hvo.storeAddr}";
    	store.name = "${hvo.storeName}";
    	store.phone = "${hvo.storePhone}";
    	store.rate = "${hvo.storeRate}";
    	store.type = "${hvo.storeType}";
    	if(store.type == '0'){
    		restaurantCount = restaurantCount + 1;
    	}
    	else if(store.type == '1'){
    		parmercyCount = parmercyCount + 1;
    	}else if(store.type == '2'){
    		cafeCount = cafeCount + 1;
    	}else if(store.type == '3'){
    		hospitalCount = hospitalCount + 1;
    	}
    	storeArray.push(store);
    </c:forEach>
    var restaurantPage = Math.ceil(restaurantCount/perPage);
    var parmercyPage = Math.ceil(parmercyCount/perPage);
    var hospitalPage = Math.ceil(hospitalCount/perPage);
    var cafePage = Math.ceil(cafeCount/perPage);
    
</script>

	<div class="btn-group d-flex">
		<button type="button" id="restaurant" class="btn btn-primary btn-lg raun" style="width: 80px;">식당</button>
		<button type="button" id="parmercy" class="btn btn-primary btn-lg raun" style="width: 80px;">약국</button>
		<button type="button" id="cafe" class="btn btn-primary btn-lg raun" style="width: 80px;">카페</button>
		<button type="button" id="hospital" class="btn btn-primary btn-lg raun" style="width: 80px;">병원</button>
	</div>
	
	<div class="btn-group d-flex">
		<button type="button" id="restaurant" class="btn btn-primary btn-lg search" style="width: 80px;">현재위치에서찾기</button>
	</div><br><br>
	<!-- 업체 0. 식당, 1. 약국, 2. 카페, 3. 병원 //지도 api 에 접근하는 주소가 localhost(x), 도메인, 아이피(o) -->
	<!-- 스크립트에서 페이징, 버튼 onclick로 변경? -->
	<div>
		<article id="restaurantArticle"></article>
		<article id="parmercyArticle"></article>
		<article id="cafeArticle"></article>
		<article id="hospitalArticle"></article>
		<div style = "text-align: center; position:relative"><br>
			<a href=# id='prev'>◀</a>
			<a id=pageNumber></a>
			<a href=# id='next'>▶</a>
		</div>
	</div>
	
<script>
// 버튼 쿼리 다 가져오기
btns = document.querySelectorAll('.raun');
search = document.querySelectorAll('.search');
art = document.querySelectorAll('article');
var btnState;
var btnStateHTML;
btns.forEach( (bt) => {
	bt.addEventListener('click', (event) => {
		btnState = bt;
		btnStateHTML = btnState.innerHTML
		btns.forEach( (other) => { other.className = 'btn btn-primary btn-lg'; })
		event.target.className += ' on';
		if(btnStateHTML === "식당"){
			paging('0', '1');
			$('#pageNumber *').remove();
			for(var i = 1 ; i <= restaurantPage ; i++){
				$('#pageNumber').append('<button style="border-style:none; background-color:white;" onclick="paging(\''+ 0 + '\',\'' + i + '\')">'+i+'</button>');
			}
		}
		else if(btnStateHTML === "약국"){
			paging('1', '1');
			$('#pageNumber *').remove();
			for(var i = 1 ; i <= parmercyPage ; i++){
				$('#pageNumber').append('<button style="border-style:none; background-color:white;" onclick="paging(\''+ 1 + '\',\'' + i + '\')">'+i+'</button>');
			}
		}
		else if(btnStateHTML === "카페"){
			paging('2', '1');
			$('#pageNumber *').remove();
			for(var i = 1 ; i <= cafePage ; i++){
				$('#pageNumber').append('<button style="border-style:none; background-color:white;" onclick="paging(\''+ 2 + '\',\'' + i + '\')">'+i+'</button>');
			}
		}
		else if(btnStateHTML === "병원"){
			paging('3', '1');
			$('#pageNumber *').remove();
			for(var i = 1 ; i <= hospitalPage ; i++){
				$('#pageNumber').append('<button style="border-style:none; background-color:white;" onclick="paging(\''+ 3 + '\',\'' + i + '\')">'+i+'</button>');
			}
		}
		art.forEach( (other) => { other.className = ''; })
		document.getElementById(event.target.id + 'Article').className = 'on';
	})
});

function paging(type, page){
	if (type === '0' && page !== 1){$("#restaurantArticle *").remove();}
	if (type === '1' && page !== 1){$("#parmercyArticle *").remove();}
	if (type === '2' && page !== 1){$("#cafeArticle *").remove();}
	if (type === '3' && page !== 1){$("#hospitalArticle *").remove();}
	$.ajax({
	      url:"${cpath}/hours24/"+type+"/"+page+"/",
	      method:"GET",
	      dataType:"text",
	      success : function(data) {
	         result = JSON.parse(data);
             for (key in result) {      // 리스트 중 하나의 객체
                member = result[key];
                card = document.createElement('div');
                card.className = 'card';
                body = document.createElement('div');
                body.className = 'card-body';
                var title = '<h5 class="card-title">' + member.storeName + '</h5>'
                			+ '<p class="card-text">' + member.storeAddr + '</p>'
                			+ '<p class="card-text">' + member.storePhone + '</p>';
                body.innerHTML = title;
                card.append(body);
                if (type === '0'){$("#restaurantArticle").append(card);}
            	if (type === '1'){$("#parmercyArticle").append(card);}
            	if (type === '2'){$("#cafeArticle").append(card);}
            	if (type === '3'){$("#hospitalArticle").append(card);}
             }
	      },
	      error:function(data){
	         $("#idmsg").text('서버 통신 실패');
	      }
	})
}	

var placeOverlay = new kakao.maps.CustomOverlay();

var markers = [];
var btset;

btns.forEach( (bt) => {
	// 버튼눌렀을 시 
	bt.addEventListener('click', (event) => {
		btns.forEach( (other) => { other.className = 'btn btn-primary btn-lg'; })
		event.target.className += ' on';		
	 	storeArray.forEach(function(store, index) {
			if(bt.innerHTML === '약국'){
				if(store.type === '1'){
					btset = bt;
					geocoder.addressSearch(store.addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var value = new Object();
		    				value.position = new kakao.maps.LatLng(result[0].y,  result[0].x);
		    				value.addr = store.addr;
		    				value.name = store.name;
		    				value.phone = store.phone;
		    				value.rate = store.rate;
		    				parmercyArray.push(value);
		    			}
					});
				}
			}
		 	else if(bt.innerHTML === '식당'){
				if(store.type === '0'){
					btset = bt;
					geocoder.addressSearch(store.addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var value = new Object();
		    				value.position = new kakao.maps.LatLng(result[0].y,  result[0].x);
		    				value.addr = store.addr;
		    				value.name = store.name;
		    				value.phone = store.phone;
		    				value.rate = store.rate;
		    				restaurantArray.push(value);
		    			}
					});
				}
	    	}else if(bt.innerHTML === '카페'){
				if(store.type === '2'){
					btset = bt;
					geocoder.addressSearch(store.addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var value = new Object();
		    				value.position = new kakao.maps.LatLng(result[0].y,  result[0].x);
		    				value.addr = store.addr;
		    				value.name = store.name;
		    				value.phone = store.phone;
		    				value.rate = store.rate;
		    				cafeArray.push(value);
		    			}
					});
				}
	    	}else if(bt.innerHTML === '병원'){
				if(store.type === '3'){
					btset = bt;
					geocoder.addressSearch(store.addr, function(result, status) {
		    			if (status === kakao.maps.services.Status.OK) {
		    				var value = new Object();
		    				value.position = new kakao.maps.LatLng(result[0].y,  result[0].x);
		    				value.addr = store.addr;
		    				value.name = store.name;
		    				value.phone = store.phone;
		    				value.rate = store.rate;
		    				hospitalArray.push(value);
		    			}
					});
				}
	    	}
	 	});
	});
});
//================================================================================================================================
function infoBox(marker) {
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
				+ '    <span class="tel">' + strArray[2] + '</span>' + '</div>'
				+ '<div class="after"></div>';
					
	contentNode.innerHTML = content;
	// contentNode.innerHTML = "가게명 : " + strArray[0] + "<br> 주소 : " + strArray[1];
	// contentNode.innerHTML = "번호 : " + strArray[2] + "<br> 평점 : " + strArray[3];
	
	placeOverlay.setPosition(new kakao.maps.LatLng(marker.getPosition().Ha, marker.getPosition().Ga));
	placeOverlay.setContent(contentNode);
	placeOverlay.setMap(map);
}
//================================================================================================================================
search.forEach( (sc) => {
	sc.addEventListener('click', (event) => {
		placeOverlay.setMap(null);	//지도에 표시되고 있는 info를 제거합니다
		removeMarker();				//지도에 표시되고 있는 마커를 제거합니다
		console.log(btset.innerHTML);
		if(btset.innerHTML === '약국'){
			for(i=0;i<parmercyArray.length;i++){
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), parmercyArray[i].position.getLat(),parmercyArray[i].position.getLng()) < 2000) {
		            marker = addMarker(parmercyArray[i].position,  parmercyArray[i].name+"@"+parmercyArray[i].addr+"@"+parmercyArray[i].phone+"@"
		            		+parmercyArray[i].rate);
		            markers.forEach( (marker) => {
		            	kakao.maps.event.addListener(marker, 'click', function() {
							infoBox(marker);
		            	});
		            });
		 		}
			}
		}else if(btset.innerHTML === '식당'){
			for(i=0;i<restaurantArray.length;i++){
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), restaurantArray[i].position.getLat(),restaurantArray[i].position.getLng()) < 2000) {
		            marker = addMarker(restaurantArray[i].position,  restaurantArray[i].name+"@"+restaurantArray[i].addr+"@"+restaurantArray[i].phone+"@"
		            		+restaurantArray[i].rate);
		            markers.forEach( (marker) => {
		            	kakao.maps.event.addListener(marker, 'click', function() {
							infoBox(marker);
		            	});
		            });
		 		}
			}
		}else if(btset.innerHTML === '카페'){
			for(i=0;i<cafeArray.length;i++){
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), cafeArray[i].position.getLat(), cafeArray[i].position.getLng()) < 2000) {
		            marker = addMarker(cafeArray[i].position,  cafeArray[i].name+"@"+cafeArray[i].addr+"@"+cafeArray[i].phone+"@"
		            		+cafeArray[i].rate);
		            markers.forEach( (marker) => {
		            	kakao.maps.event.addListener(marker, 'click', function() {
							infoBox(marker);
		            	});
		            });
		 		}
			}
    	}else if(btset.innerHTML === '병원'){
			for(i=0;i<hospitalArray.length;i++){
		 		if (calcDistance(latlngj.getLat(), latlngj.getLng(), hospitalArray[i].position.getLat(), hospitalArray[i].position.getLng()) < 2000) {
		            marker = addMarker(hospitalArray[i].position,  hospitalArray[i].name+"@"+hospitalArray[i].addr+"@"+hospitalArray[i].phone+"@"
		            		+hospitalArray[i].rate);
		            markers.forEach( (marker) => {
		            	kakao.maps.event.addListener(marker, 'click', function() {
							infoBox(marker);
		            	});
		            });
		 		}
			}
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

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, title) {
    var imageSrc = '${pageContext.request.contextPath }/img/image4.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(50, 36),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(43, 36), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(10, 0), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage, 
            title: title
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

</script>



