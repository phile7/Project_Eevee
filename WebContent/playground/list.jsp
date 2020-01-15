<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL 사용하면 import의 번잡함이 감소, java 변수선언 감소 JSP태그 번잡함 감소-->

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
		border-bottom: 1px dotted;
}
#sub1{
		width: 420px;
		padding: 0;

}
#reg1{
		width: 200px;
		padding: 0;
		
}
#num1{
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
	background: url(playground/CSS/writ.png) center center no-repeat;
	
}

#mgo {
	padding: 0;
	width: 81px;
	height: 81px;
	background: url(playground/CSS/hom.png) center center no-repeat;
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
<link rel="stylesheet" type="text/css" href="playground/CSS/list.css"/>

<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>  	
<div class="container">
	<div class ="tong">
		<table>
			<tr class="title">  
				<td class="title" colspan="3">놀 이 터</th>
			</tr> 
			<tr>
				<th id = "num1">번호</th> 
				<th id = "sub1">제목</th>
				<th id = "reg1">등록일</th>
			</tr>  
			<c:forEach var="dto" items="${list }" varStatus="status">
				<tr class="writes">
					<td>${cnt - ((page - 1) * pageRows + status.index) }</td>
					<td><a href="view.do?uid=${dto.pwr_uid }&page=${page }">${dto.subject }[${arrComment[status.index]}]</a></td>
					<td>${dto.regDate }</td>
				</tr>
			</c:forEach>		
		</table>
		<br> 
		<div id="wtb">
			<button  id="wtbb" class="buttons" onclick="location.href='write.do?uid=${sessionScope.uid}'"></button>
		</div>
		
		<div id="mgoL">
			<form class="mainpage" action="mainPage.do">
			<input  id = "mgo" class="buttons" type="submit" value=""><br>
			</form>
		</div>
		
		<div id="pageN">	
			<jsp:include page="pagination.jsp">
				<jsp:param value="${writePages }" name="writePages"/>
				<jsp:param value="${totalPage }" name="totalPage"/>
				<jsp:param value="${page }" name="curPage"/>
			</jsp:include>
		</div>
	</div>
</div>
</body>
</html>







