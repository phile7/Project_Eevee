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
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<th>순위</th>
		<th>이름</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>평점</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${dto.t_name }</td>
			<td>${dto.t_location }</td>
			<td>${dto.t_location_O }</td>
			<td>${dto.ts_score }</td>
			<td style="display:hidden"></td>
		</tr>
	</c:forEach>		
</table>
<br>

</body>
</html>







