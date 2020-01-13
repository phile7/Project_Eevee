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
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="center/CSS/list.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
</head>
<body>
<h2>리스트</h2>
<hr>
<h2>로그인 상태입니다</h2>
<form action="logout.do">
<input type="submit" value="로그아웃"><br>
</form>
<h2>메인페이지</h2>
<form action="mainPage.do">
<input type="submit" value="메인페이지"><br>
</form>
<hr>
<table>
	<tr>
		<th>번호</th>
		<th>글종류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${dto.mb_level==2 }">
				<tr>
					<td>${(page - 1) * pageRows + status.index + 1 }</td>
					<td>공지</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }">${dto.subject }</a></td>
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
				<tr>
					<td>${(page - 1) * pageRows + status.index + 1 }</td>
					<td>건의</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }">${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
				</tr>
			</c:when>
		</c:choose>	
	</c:forEach>

		
</table>
<br>
<button onclick="location.href='cwrite.do?uid=${sessionScope.uid}'">신규등록</button>
	
<jsp:include page="cpagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>

</body>
</html>






