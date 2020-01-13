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
<h2>화장실게시판</h2>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>별점</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${arrToilet }" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href="view.tdo?uid=${dto.twr_uid }&t_uid=${dto.t_uid}">${dto.subject }</a></td>
			<td>${dto.mb_id }</td>
			<td>${dto.twr_score }</td>
			<td>${dto.viewCnt }</td>
			<td>${dto.regDate }</td>
		</tr>
	</c:forEach>		
</table>
<h2>놀이터게시판</h2>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${arrWrite }" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href="view.do?uid=${dto.pwr_uid }">${dto.subject }</a></td>
			<td>${dto.mb_id }</td>
			<td>${dto.viewCnt }</td>
			<td>${dto.regDate }</td>
		</tr>
	</c:forEach>		
</table>
<h2>고객센터</h2>
<table>
	<tr>
		<th>번호</th>
		<th>글종류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${arrCenter }" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>공지</td>
			<td><a href="cview.do?uid=${dto.cwr_uid }">${dto.subject }</a></td>
			<td>${dto.mb_id }</td>
			<td>${dto.viewCnt }</td>
			<td>${dto.regDate }</td>
		</tr>
	</c:forEach>
</table>
<br>
</body>
</html>







