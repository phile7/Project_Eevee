<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예제 메인</title>
</head>
<body>
반가워 메인페이지야~
sessionScope.uid : ${sessionScope.uid} <br>
sessionScope.id : ${sessionScope.id} <br>
sessionScope.level : ${sessionScope.level} <br>
<h2>로그인 상태입니다</h2>
<form action="logout.do">
<input type="submit" value="로그아웃"><br>
</form>	
<h2>놀이터게시판</h2>
<form action="list.do">
<input type="submit" value="놀이터게시판"><br>
</form>	
<h2>고객센터</h2>
<form action="clist.do">
<input type="submit" value="고객센터"><br>
</form>	
</body>
</html>