<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="beans.toilet.*" %>    
<%@ page import = "java.sql.*" %>

<%
	ToiletDTO [] arr = (ToiletDTO [] )request.getAttribute("data");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Do It</title>
</head>

<link rel="stylesheet" href="css/map01.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	<!--  사용될 수도 있기 때문에  -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e74f5e39c3142a6c0f11bedb03510b"></script>		<!--  지도 API 인증키 -->
<script src="Mapjs02.js" type="text/javascript"></script>	<!--  마커 정보 배열을 담은 JS 파일 -->

<body>

<div id="map">
		<div id ="pop">
			

		
		</div>
</div>	<!-- 지도 div -->

<script>

var uid = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 4
// 지도의 확대 레벨 
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition);
        
      //지도에 표시할 원을 생성합니다
        var circle = new kakao.maps.Circle({
            center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
            radius: 500, // 미터 단위의 원의 반지름입니다 
            strokeWeight: 5, // 선의 두께입니다 
            strokeColor: '#75B8FA', // 선의 색깔입니다
            strokeOpacity:  0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'dashed', // 선의 스타일 입니다
            fillColor: '#CFE7FF', // 채우기 색깔입니다
            fillOpacity: 0.7  // 채우기 불투명도 입니다   
        }); 

        // 지도에 원을 표시합니다 
        circle.setMap(map);
        
        // context 수정
		var url = "http://localhost:8081/togetter/location.ajax?lat=" + lat + "&lon=" + lon;
        
        // 서울 이외의 영역 마커(제주도)
		// var url = "http://localhost:8081/togetter/location.ajax?lat=33.491975&lon=126.490608";
		
        // 아무마커도 찍히지 않는 위치 (테스트용)
		// var url = "http://localhost:8081/togetter/location.ajax?lat=37.497146&lon=127.048162";
		
        // 위도 경도로 uid 가져오는 ajax
		$.ajax({
			url : url,
			type : "GET",
			cache : false,
			dataType: "json",
			success : function(data, status){
				if(status == "success") {
					var arr = [];
					arr = parseUidJson(data);
					// console.log(arr.length)
					for(i = 0; i < arr.length; i++){
						uid[i] = arr[i];
					}
				}
				console.log("arr : " + arr);
				console.log("ajax 내부 : " + uid);
				
				
				var arMarker = [];
				var newPositions = [];
				var cnt = 0;
				
				for(var i = 0; i < positions.length; i++){
					for(var j = 0; j < uid.length; j++){
						if(positions[i].title == uid[j]){
							arMarker[cnt] = uid[j];
							newPositions[cnt] = positions[i];
							cnt++;
						}
					}
				}
				
				console.log("arMarker : " + arMarker);
				console.log(newPositions);
				//console.log(positions[1]);
				
				for (var i = 0; i < newPositions.length; i++) {

					
					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35);
						
					// 마커 이미지를 생성합니다    
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					
					// 만약 500m내에 화장실 없으면 마커 찍기 전에 탈출
					if(newPositions[0].title == -9999) break;
					
					// 마커를 생성합니다
					marker = new kakao.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : newPositions[i].latlng, // 마커를 표시할 위치
						title : newPositions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						image : markerImage // 마커 이미지 
					});
					
					// 마커 배열 생성 메서드
					markers.push(marker);
					
					// 마커 클릭 이벤트, 해당 uid db ajax로 가져오기
					kakao.maps.event.addListener(markers[i], 'click', function() {
						var t_uid = this.getTitle();

						// url 수정
						url = "http://localhost:8081/togetter/data.ajax?t_uid=" + t_uid;
						
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							dataType: "json",
							success : function(data, status){
								if(status == "success") parseJSON(data);
							}
						});
					
					});
					
					function parseJSON(jsonObj){
						
						var data = jsonObj.Datalist;

						var table = "<tr></tr>";
						for (i = 0; i < data.length; i++) {
							table += "<tr>"; 
							table += "<td>" + data[i].t_uid + "</td>";
							table += "<td>" + data[i].t_name + "</td>";
							table += "<td>" + data[i].t_location + "</td>";
							table += "<td>" + data[i].t_location_o + "</td>";
							table += "<td>" + data[i].t_gender + "</td>";
							table += "<td>" + data[i].t_kid_M + "</td>";
							table += "<td>" + data[i].t_kid_W + "</td>";
							table += "<td>" + data[i].t_disabled_M + "</td>";
							table += "<td>" + data[i].t_disabled_W + "</td>";
							table += "<td>" + data[i].t_count_M + "</td>";
							table += "<td>" + data[i].t_count_W + "</td>";
							table += "</tr>"; 
						};
						
						$("#demoJSON").html(table);
						
					};
						
				}
				
			}
		}); // end ajax
        
        //uid = [];

        //console.log("ajax 외부 : " + uid);
        
         function parseUidJson(json){
        	
    		var data = json.location;

    		var arr = [];
    		for (var i = 0; i < data.length; i++) {
    			arr[i] = data[i].t_uid;
    		};
    		
    		return arr;
    		
    	};
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
        
    displayMarker(locPosition);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

// 마커 이미지 테스트
// var imageSrc = "../IMG/markerEX.png";

var markers = [];

</script>

</body>
</html>

