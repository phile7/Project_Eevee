<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		location.href = 'deleteOk.do?uid=' + id;
	}
}

function chkDeleteComment(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteCommentOk.do?uid=' + id + '&pwr_uid=' + ${read[0].pwr_uid};
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
	<br>
	<c:forEach var="dto" items="${comment }" varStatus="status">
		<span>아이디 : ${dto.mb_id }</span>
		<span>등록일 : ${dto.regDate }</span>
		<c:if test="${dto.co_depth == 1}">
			<div>내용 : ${dto.comment }</div>
		</c:if>
		<c:forEach var="comtocom" items="${commentToComment }" begin="0" end="${fn:length(commentToComment) }" varStatus="status">
			<c:if
				test="${comtocom.co_depth == 2 and dto.co_uid == comtocom.co_puid}">
				<span>아이디 : ${comtocom.mb_id }</span>
				<span>등록일 : ${comtocom.regDate }</span>
				<div>내용 : ${comtocom.comment }</div>
				<c:if
					test="${sessionScope.uid == comtocom.mb_uid or sessionScope.level == 2}">
					<button onclick="chkDeleteComment(${dto.co_uid })">삭제하기</button>
				</c:if>
			</c:if>
		</c:forEach>
		<c:if
			test="${sessionScope.uid == dto.mb_uid or sessionScope.level == 2}">
			<button onclick="chkDeleteComment(${dto.co_uid })">삭제하기</button>
		</c:if>
		<form name="form"
			action="commentToComment.do?uid=${sessionScope.uid}&co_uid=${dto.co_uid}&pwr_uid=${read[0].pwr_uid}"
			method="post" onsubmit="return chkSubmitCommentToComment()">
			<input type="text" name="comment" style="width: 600px" /> <input
				type="submit" value="댓글등록" />
		</form>
		<hr>
	</c:forEach>
	<br>
	<c:if
		test="${sessionScope.uid == read[0].mb_uid or sessionScope.level == 2}">
		<button onclick="chkDelete(${read[0].pwr_uid })">삭제하기</button>
		<button onclick="location.href = 'update.do?uid=${read[0].pwr_uid }'">수정하기</button>
	</c:if>
	<button onclick="location.href = 'list.do?page=${page}'">목록보기</button>
	<button onclick="location.href = 'write.do?uid=${sessionScope.uid}'">신규등록</button>
	<form name="frm"
		action="comment.do?uid=${sessionScope.uid}&pwr_uid=${read[0].pwr_uid}"
		method="post" onsubmit="return chkSubmitComment()">
		<input type="text" name="comment" style="width: 600px" /> <input
			type="submit" value="댓글등록" />
	</form>
</body>
		</html>

	</c:otherwise>
</c:choose>









