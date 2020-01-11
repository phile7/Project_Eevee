<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
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
%>

    <c:choose>

	<c:when test="${result == 1}">
	<%
		session.setAttribute(sessionName1, sessionValue1);	
		session.setAttribute(sessionName2, sessionValue2);	
		session.setAttribute(sessionName3, sessionValue3);	
	%>
		<script>
			alert("로그인 성공!");
			location.href = "mainPage.do"
		</script>
	</c:when>
	
	<c:when test="${result == 0}">
	<%
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
		session.removeAttribute(sessionName3);
	%>
		<script>
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == -1}">
	<%
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
		session.removeAttribute(sessionName3);
	%>
		<script>
			alert("아이디가 없습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == -2}">
	<%
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
		session.removeAttribute(sessionName3);
	%>
		<script>
			alert("이메일 인증되지 않았습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
	<%
		session.removeAttribute(sessionName1);
		session.removeAttribute(sessionName2);
		session.removeAttribute(sessionName3);
	%>
		<script>
			alert("로그인 실패");
			history.back();
		</script>
	</c:otherwise>

</c:choose>
    