<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL 사용하면 import의 번잡함이 감소, java 변수선언 감소 JSP태그 번잡함 감소-->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고객센터</title>

<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Center/CSS/clist.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Center/JS/clist.js" type="text/javascript"></script>

</head>
<body style="width: 720px; height: 1300px; margin: auto;">
<div class="Maindiv">

<div class="div1"><p>고객센터</p></div>

<table>
	<tr class="MainTr">
		<th>번호</th>
		<th></th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${dto.mb_level==2 }">
				<tr class="KingTr">
					<td>${cnt - ((page - 1) * pageRows + status.index + 1) }</td>
					<td>공지</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }"; onclick="color()"; class="${(page - 1) * pageRows + status.index + 1 }";>${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
					</tr>
			</c:when>
		</c:choose>	
	</c:forEach>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${dto.mb_level==1 }">
				<tr class="SubTr">
					<td>${cnt - ((page - 1) * pageRows + status.index + 1) }</td>
					<td>건의</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }"; onclick="color()"; class="${(page - 1) * pageRows + status.index + 1 }";>${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
				</tr>
			</c:when>
		</c:choose>	
	</c:forEach>

		
</table>
<br>
<button onclick="location.href='cwrite.do?uid=${sessionScope.uid}'" class="New"><i class="fas fa-pencil-alt"></i></button>
<form action="logout.do">
<input type="submit" class="LogOutButton" value="&#xf011">
</form>
<form action="mainPage.do">
<input type="submit" value="&#xf015" class="MainPageButton">
</form>
	
<jsp:include page="cpagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>

</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Center/JS/clist.js" type="text/javascript"></script>

</html>







