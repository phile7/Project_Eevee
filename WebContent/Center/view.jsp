<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.lec.beans.*" %>  

<c:choose>
	<c:when test="${empty read || fn:length(read) == 0 }">
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>

		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<title>읽기 ${read[0].subject }</title>
</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'cdeleteOk.do?uid=' + id;
	}
}

function chkDeleteComment(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'cdeleteCommentOk.do?uid=' + id + '&cwr_uid=' + ${read[0].cwr_uid};
	}
}

function chkSubmitComment(){
	frm = document.forms["frm"];
	var subject = frm["comment"].value.trim();
	if(subject == ""){
		alert("1글자 이상 작성해야합니다");
		frm["comment"].focus();
		return false;
	}
	return true;
}

function chkSubmitCommentToComment(){
	frm = document.forms["form"];
	var subject = form["comment"].value.trim();
	if(subject == ""){
		alert("1글자 이상 작성해야합니다");
		frm["comment"].focus();
		return false;
	}
	return true;
}
</script>
<body>
	<h2>읽기 ${read[0].subject }</h2>
	<br> 작성자 : ${read[0].mb_id }
	<br> 제목: ${read[0].subject }
	<br> 등록일: ${read[0].regDate }
	<br> 조회수: ${read[0].viewCnt }
	<br> 내용:
	<br>
	<hr>
	<div>${read[0].content }</div>
	<hr>
		<c:if
		test="${sessionScope.uid == read[0].mb_uid or sessionScope.level == 2}">
		<button onclick="chkDelete(${read[0].cwr_uid })">삭제하기</button>
		<button onclick="location.href = 'cupdate.do?uid=${read[0].cwr_uid }'">수정하기</button>
	</c:if>
	<button onclick="location.href = 'clist.do?page=${page}'">목록보기</button>
	<button onclick="location.href = 'cwrite.do?uid=${sessionScope.uid}'">신규등록</button>
	<hr>
	<br>
	<%
		int cnt = 0;
	%>
	<c:forEach var="dto" items="${comment }" varStatus="status">
		<span>아이디 : ${dto.mb_id }</span>
		<span>등록일 : ${dto.regDate }</span>
		<c:if test="${dto.co_depth == 3}">
			<div>내용 : ${dto.comment }</div>
		</c:if>
		<c:if
			test="${sessionScope.uid == dto.mb_uid or sessionScope.level == 2}">
			<button onclick="chkDeleteComment(${dto.co_uid })">삭제하기</button>
		</c:if><br>
		<%
		String loginId = (String)session.getAttribute("id");
		String idLevel = (String)session.getAttribute("level");
		int indexComment = (Integer) request.getAttribute("indexComment");
		int indexCommentToComment = 0;
		CommentDTO [] comment = (CommentDTO [] )request.getAttribute("comment");
		CommentDTO [] commentToComment = null;
		for(int i = 0 + cnt; i < indexComment; i++){
			indexCommentToComment = (Integer) request.getAttribute("indexCommentToComment" + i);
			commentToComment = (CommentDTO [] )request.getAttribute("commentToComment" + i);
			for(int j = 0; j < indexCommentToComment; j++ ) {
			if(comment[i].getCo_uid() == commentToComment[j].getCo_puid()) {
				String mb_id = commentToComment[j].getMb_id();
				String regDate = commentToComment[j].getRegDate();
				String commentValue = commentToComment[j].getComment();
		%>
				<span>아이디 : <%=mb_id %></span>
				<span>등록일 : <%=regDate %></span>
				<div>내용 : <%=commentValue %></div>
		<%
				if(loginId.equals(mb_id) || idLevel.equals("2")) {
		%>
					<div><button onclick="chkDeleteComment(${dto.co_uid })">삭제하기</button></div>
		<%
				}
			}
		}
		cnt++;
		break;
		}
		%>
		<form name="form"
			action="ccommentToComment.do?uid=${sessionScope.uid}&co_uid=${dto.co_uid}&cwr_uid=${read[0].cwr_uid}"
			method="post" onsubmit="return chkSubmitCommentToComment()">
			<input type="text" name="comment" style="width: 600px" /> <input
				type="submit" value="댓글등록" />
		</form>
		<hr>
	</c:forEach>
	<br>

	<form name="frm"
		action="ccomment.do?uid=${sessionScope.uid}&cwr_uid=${read[0].cwr_uid}"
		method="post" onsubmit="return chkSubmitComment()">
		<input type="text" name="comment" style="width: 600px" /> <input
			type="submit" value="댓글등록" />
	</form>
</body>
		</html>

	</c:otherwise>
</c:choose>









