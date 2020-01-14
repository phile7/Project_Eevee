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

*{
	font-size: 18px;
}
table {width: 100%;}
table {
	border-collapse: collapse;
}
th, td{
text-align:  center;
padding: 8px;
border-bottom: 1px dotted;
}


th {
	background-color: #DDDDDD;
	font-weight:normal;
	padding: 8px;
}

a {text-decoration: none; color: black;}

.container{
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

.title{
background-color: #238556;
color: white;
text-align: center;
font-size: 20px;
padding: 8px;
font-weight: bold;
border-bottom: none;
border-collapse: collapse;

}
</style>
<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="playground/CSS/list.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>  	
<div class="container">
<table>
	<tr class="title">  
		<td class="title" colspan="3">놀이터</th>
	</tr> 
	<tr>
		<th>번호</th> 
		<th>제목</th>
		<th>등록일</th>
	</tr>  
	<c:forEach var="dto" items="${list }" varStatus="status">
		<tr class="writes">
			<td>${(page - 1) * pageRows + status.index + 1 }</td>
			<td><a href="view.do?uid=${dto.pwr_uid }&page=${page }">${dto.subject }</a></td>
			<td>${dto.regDate }</td>
		</tr>
	</c:forEach>		
</table>
<br> 
<button class="buttons" onclick="location.href='write.do?uid=${sessionScope.uid}'">신규등록</button>
<form class="mainpage" action="mainPage.do">
<input class="buttons" type="submit" value="메인페이지"><br>
</form>
<form class="logout" action="logout.do">
<input class="buttons" type="submit" value="로그아웃"><br>
</form>
	
<jsp:include page="pagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>
</div>
</body>
</html>







