<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>

	<c:when test="${result == 0}">
		<script>
			alert("등록 실패!");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == -1}">
		<script>
			alert("등록 실패! 비밀번호가 서로 다릅니다.");
			history.back();
		</script>
	</c:when>
	
	<c:when test="${result == 2}">
		<script>
			alert("등록 실패! 이미 있는 ID 입니다.");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("등록 성공! 환영합니다! 이메일 인증을 해주세요!");
			location.href = "login_sendEmail.do";
		</script>
	</c:otherwise>

</c:choose>
    