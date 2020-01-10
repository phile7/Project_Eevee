<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int cnt = (Integer) request.getAttribute("check");
	String uid = (String) request.getAttribute("uid");
	String level = (String) request.getAttribute("level");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	String sessionName1 = "uid";
	String sessionValue1 = uid;
	String sessionName2 = "id";
	String sessionValue2 = id;
	String sessionName3 = "level";
	String sessionValue3 = level;
	if (cnt == 0) {
		out.println("<script>");
		out.println("alert('로그인 실패');");
		out.println("</script>");
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
		session.removeAttribute(sessionName3);
	} else {
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("</script>");
		session.setAttribute(sessionName1, sessionValue1);	
		session.setAttribute(sessionName2, sessionValue2);	
		session.setAttribute(sessionName3, sessionValue3);	
	}
%>

<script>
	location.href = "login.do";
</script>

















