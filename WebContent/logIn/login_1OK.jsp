<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    
    <c:choose>

	<c:when test="${result == 1}">
		<script>

			alert("로그인 성공!");
			location.href = "mainPage.do"
		</script>
	</c:when>
	
	<c:when test="${result == 0}">
		<script>
			alert("비밀번호가 다릅니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == -1}">
		<script>
			alert("아이디가 없습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == -2}">
		<script>
			alert("이메일 인증되지 않았습니다.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("로그인 실패");
			history.back();
		</script>
	</c:otherwise>

</c:choose>
    