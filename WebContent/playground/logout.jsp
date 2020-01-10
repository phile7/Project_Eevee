<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionName1 = "uid";
	String sessionName2 = "id";
	
	// 세션 삭제
	session.removeAttribute(sessionName1);
	session.removeAttribute(sessionName2);
%>

<script>
alert("로그아웃 되어습니다");
location.href = "login.do";
</script>











