<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login 페이지</title>
</head>
<body>
<%
	if(session.getAttribute("uid") != null){					
%>
	<script>
	location.href = "list.do";
	</script>
<%
	} else {
%>
	<h2>로그인 상태가 아닙니다</h2>
	<form action="loginOk.do">
		id: <input type="text" name="id"><br>
		pw: <input type="password" name="pw"><br>
		<input type="submit" value="로그인"><br>
	</form>
<%}%>
	
</body>
</html>



















