<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<c:choose>
	<c:when test="${result_member == 0 }">
		<script>
			alert("회원탈퇴에 실패하셨습니다");
			<% session.invalidate(); %>
			location.href = "login_1.do";
			hisotry.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("삭제 성공");
			<% session.invalidate(); %>
			location.href = "login_1.do";
		</script>
	</c:otherwise>
</c:choose>
