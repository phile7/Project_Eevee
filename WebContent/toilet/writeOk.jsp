<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.sql.*" %>
<%@ page import="com.lec.beans.*" %>  
<%
	int t_uid = Integer.parseInt(request.getParameter("t_uid"));
%>
<c:choose>
	<c:when test="${result==0 }">
		<script>
			alert("등록 실패!!!!!");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록성공, 리스트를 출력합니다");
			location.href = "list.tdo?t_uid=<%=t_uid%>";
		</script>
	</c:otherwise>
</c:choose>












