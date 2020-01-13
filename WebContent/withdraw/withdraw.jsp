<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<c:choose>
	<c:when test="${result_playground == 0 }">
		<script>
			alert("놀이터 게시판에 글이 없거나 삭제에 실패하셨습니다");
			<% session.invalidate(); %>
			location.href = "login_1.do";
			hisotry.back();
		</script>
	</c:when>
	<c:when test="${result_toilet == 0 }">
		<script>
			alert("화장실 게시판에 글이 없거나 삭제에 실패하셨습니다");
			<% session.invalidate(); %>
			location.href = "login_1.do";
			hisotry.back();
		</script>
	</c:when>
	<c:when test="${result_center == 0 }">
		<script>
			alert("고객센터에 글이 없거나 삭제에 실패하셨습니다");
			<% session.invalidate(); %>
			location.href = "login_1.do";
			hisotry.back();
		</script>
	</c:when>
	<c:when test="${result_comment == 0 }">
		<script>
			alert("댓글이 없거나 삭제에 실패하셨습니다");
			<% session.invalidate(); %>
			location.href = "login_1.do";
			hisotry.back();
		</script>
	</c:when>
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
