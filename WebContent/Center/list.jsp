<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style>
body{
		padding: 0;
		margin: 0;
}

*{
	font-size: 25px;
}
table { 
		width: 100%;
		border-collapse: collapse;
}

th, td{
		height: 60px;
		text-align:  center;
		padding: 0;
		border-bottom: 1px dotted black;
}

#sub1{
		width: 170px;
		padding: 0;

}
#reg1{
		width: 150px;
		padding: 0;
		
}
#id1{
		width: 100px;
		padding: 0;
		
}
#num1{
		width: 100px;
		padding: 0;
		
}
#score1{
		width: 100px;
		padding: 0;
		
}
#cnt1{
		width: 100px;
		padding: 0;
		
}


th {
		background-color: #DDDDDD;
		font-weight:normal;
		padding: 0;
		
}

a {text-decoration: none; color: black;}

.container{		/* 반응형 */
	position: relative;
	width: 720px;
	height: 1300px;
	margin: 0px auto;
}
.mainpage{
	float: left;
	
}

.buttons{
	background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    color: #238556;
}

.logout{
	float: right;
}

.title{	/* 반응형 */
	background-color: #238556;
	color: white;
	text-align: center;
	font-size: 30px;
	padding: 0;
	height: 65px;
	font-weight: bold;
	border-bottom: none;
	border-collapse: collapse;
	width: 720px;

}

.tong{
	position: absolute;
	top: 65px;
}

#wtb {
	position:absolute;
	width: 81px;
	height: 81px;
	right: 40px;
	padding: 0;
	z-index: 2;
}
#wtbb{
	width:81px;
	height: 81px;
	background: url(Center/CSS/writ.png) center center no-repeat;
	
}

#mgo {
	padding: 0;
	width: 81px;
	height: 81px;
	background: url(Center/CSS/hom.png) center center no-repeat;
}

#mgoL {
	position:absolute;
	width: 100px;
	height: 36px;
	left: 40px;
	z-index: 2;
}


#pageN {
	padding: 0;
	margin: 0;
	position: absolute;
	bottom: -130px;
	width: 720px;
	height: 100px;
}

.mainpage{
	left: 40px;
}

#ppn {	/* 반응형 */

	width: 720px;
}

</style>
<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Center/CSS/list.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<div class="container">
	<div class ="tong">
		<table>
			<tr class="title">  
				<th class="title" colspan="6">고객센터</th>
			</tr>
			<tr>
				<th id = "num1">번호</th>
				<th id = "score1">글종류</th>
				<th id = "sub1">제목</th>
				<th id = "id1">작성자</th>
				<th id = "cnt1">조회수</th>
				<th id = "reg1">등록일</th>
			</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
	<tr class="writes">
		<c:choose>
			<c:when test="${dto.mb_level==2 }">
				<tr style="color: red; font-weight: bold;">
					<td>${cnt - ((page - 1) * pageRows + status.index) }</td>
					<td>공지</td>
					<td><a style = "color : red; font-weight: bold;" href="cview.do?uid=${dto.cwr_uid }&page=${page }">${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
				</tr>
			</c:when>
		</c:choose>	
	</tr>
	</c:forEach>
	<c:forEach var="dto" items="${list }" varStatus="status">
	<tr class="writes">
		<c:choose>
			<c:when test="${dto.mb_level==1 }">
				<tr>
					<td>${cnt - ((page - 1) * pageRows + status.index + 1) }</td>
					<td>건의</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }">${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
				</tr>
			</c:when>
		</c:choose>
	</tr>
	</c:forEach>

		
</table>
<br>
<div id="wtb">
<button id="wtbb" class="buttons" onclick="location.href='cwrite.do?uid=${sessionScope.uid}'"></button>
</div>

		<div id="mgoL">
			<form class="mainpage" action="mainPage.do">
			<input  id = "mgo" class="buttons" type="submit" value=""><br>
			</form>
		</div>
		
		<div id="pageN">
			<jsp:include page="cpagination.jsp">
				<jsp:param value="${writePages }" name="writePages"/>
				<jsp:param value="${totalPage }" name="totalPage"/>
				<jsp:param value="${page }" name="curPage"/>
			</jsp:include>
		</div>
	</div>
</div>
</body>
</html>







