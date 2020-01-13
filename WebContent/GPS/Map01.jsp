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
 
 <link rel="stylesheet" href="./GPS/css/map01.css">  
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e74f5e39c3142a6c0f11bedb03510b"></script>		<!--  지도 API 인증키 -->
 
 <body>
 
 <div id="map">
		<div id ="pop">
		<div id="menubar">
				<div id="btn1"></div>
				<div id="btn_bar" class="square">
					<div id="btn_close"></div>
					<div id="rk"><a href="#">랭킹보드</a></div>
					<div id="play"><a href="#">놀이터게시판</a></div>
					<div id="out"><a href="#">로그아웃</a></div>
					<div id="ex"><a href="#">회원탈퇴</a></div>
				</div>
		</div>
		<div id="pop">
			<div id="demoJSON"></div>
			<div id="score"><a href="#"></a></div>
			<div id="tlist">리뷰 게시판</div>	
			
			
			
		</div>

		
		</div>
	
 </div>	<!-- 지도 div -->

 <script>

         
         // context 수정
		var url = "http://localhost:8080/Project_Eevee/location.ajax?lat=" + lat + "&lon=" + lon;
         
         // 서울 이외의 영역 마커(제주도)
 		// var url = "http://localhost:8081/togetter/location.ajax?lat=33.491975&lon=126.490608";

 						var t_uid = this.getTitle();
 
 						// url 수정
						url = "http://localhost:8080/Project_Eevee/data.ajax?t_uid=" + t_uid;
 						
 						$.ajax({
 							url : url,
 						
 						var data = jsonObj.Datalist;
 
						$("#pop").animate({"bottom" : "0px"})
						
						// 데이터 확인용 -> 클릭했을 때 맵 밑에 정보 나열
						var div = "<div id='info'>";
 						for (i = 0; i < data.length; i++) {
							<%--
 							table += "<tr>"; 
 							table += "<td>" + data[i].t_uid + "</td>";
 							table += "<td>" + data[i].t_name + "</td>";
 							table += "<td>" + data[i].t_count_M + "</td>";
 							table += "<td>" + data[i].t_count_W + "</td>";
 							table += "</tr>"; 
						--%>
						
							div += "<div id='tname'>" + data[i].t_name + "</div>";
							
							div += "<div id='tloca'>" + data[i].t_location_o + "</div>"
							
							if(data[i].t_count_M > 0){
										div += "<div id='tmc'></div>";
							} 
							if(data[i].t_count_W > 0){
										div += "<div id='twc'></div>";
							}
							if(data[i].t_disabled_M > 0){
								div += "<div id='tdm'></div>";
							}
							if(data[i].t_disabled_W > 0){
								div += "<div id='tdw'></div>";
							}
					
							div += "</div>";
						
						};
 						
						$("#demoJSON").html(div);
 						
					};	// parseJSON end
					
 						
 				}
 				
 var markers = [];
 
 </script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	<!--  사용될 수도 있기 때문에  -->
<script src="./GPS/Mapjs02.js" type="text/javascript"></script>	<!--  마커 정보 배열을 담은 JS 파일 -->
<script src="GPS/js/gps.js"></script>
 </html>

