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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Center/CSS/view.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<body style="width: 720px; height: 1300px; margin: auto;">
<div class="MainDiv">
	<p class="p1">작성자 : ${read[0].mb_id }</p><br>
	<p class="p2"> 제목 : ${read[0].subject }</p><br>
	<p class="p3">등록일 : ${read[0].regDate }</p>
	<p class="p4">조회수 : ${read[0].viewCnt }</p><br>
	<div class="ContentDiv"><div class="ContentDiv2">${read[0].content }</div></div>
		<c:if
		test="${sessionScope.uid == read[0].mb_uid or sessionScope.level == 2}">
		<button onclick="chkDelete(${read[0].cwr_uid })" class="Delete1"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
		<button onclick="location.href = 'cupdate.do?uid=${read[0].cwr_uid }'" class="goEdit"><i class="fas fa-edit"></i></button>
	</c:if>
	<button onclick="location.href = 'clist.do?page=${page}'" class="goList"><i class="fas fa-home"></i></button>
	<button onclick="location.href = 'cwrite.do?uid=${sessionScope.uid}'" class="goWrite"><i class="fas fa-pencil-alt"></i></button>
	<br>
	<%
		int cnt = 0;
	%>
	<div class="CommentDiv">
	<c:forEach var="dto" items="${comment }" varStatus="status">
		<p class="p5">${dto.mb_id }</p>
		<p class="p6">${dto.regDate }</p>
		<c:if test="${dto.co_depth == 3}">
			<div class="div1"><p class="p7">${dto.comment }</p></div>
		</c:if>
	</div>
		<c:if
			test="${sessionScope.uid == dto.mb_uid or sessionScope.level == 2}">
			<button onclick="chkDeleteComment(${dto.co_uid })" class="Delete2"><i class="fas fa-eraser"></i></button>
		</c:if><br>
		<%
		String loginId = (String)session.getAttribute("id");
		String idLevel = (String)session.getAttribute("level");
		int indexComment = (Integer) request.getAttribute("indexComment");
		int indexCommentToComment = 0;
		CommentDTO [] comment = (CommentDTO [] )request.getAttribute("comment");
		CommentDTO [] commentToComment = null;
		for(int i = 0 + cnt; i < indexComment; i++) {
			indexCommentToComment = (Integer) request.getAttribute("indexCommentToComment" + i);
			commentToComment = (CommentDTO [] )request.getAttribute("commentToComment" + i);
			for(int j = 0; j < indexCommentToComment; j++ ) {
			if(comment[i].getCo_uid() == commentToComment[j].getCo_puid()) {
				String mb_id = commentToComment[j].getMb_id();
				String regDate = commentToComment[j].getRegDate();
				String commentValue = commentToComment[j].getComment();
		%>
				<div class="CommentDD-0">
				<p class="p-0"><%=mb_id %></p>
				<p class="p-1"><%=regDate %></p>
				<div class="Ddiv-0"><p class="p-3"><%=commentValue %></p></div>
				</div>
		<%
				if(loginId.equals(mb_id) || idLevel.equals("2")) {
		%>
					<div><button onclick="chkDeleteComment(${dto.co_uid })" class="Delete3"><i class="fas fa-eraser"></i></button></div>
		<%
				}
			}
		cnt++;
		}
		}
		%>
		<form name="form"
			action="ccommentToComment.do?uid=${sessionScope.uid}&co_uid=${dto.co_uid}&cwr_uid=${read[0].cwr_uid}"
			method="post" onsubmit="return chkSubmitCommentToComment()">
			<input type="text" name="comment" class="ComText" /> <input
				type="submit" value="&#xf040" class="Com" />
		</form>
	</c:forEach>
</div>
	<%-- 
	<form name="frm"
		action="ccomment.do?uid=${sessionScope.uid}&cwr_uid=${read[0].cwr_uid}"
		method="post" onsubmit="return chkSubmitComment()">
		<input type="text" name="comment" style="width: 600px" /> <input
			type="submit" value="댓글등록" />
	</form>
	--%>
<div class="Maindiv2">
<table>
	<tr class="MainTr">
		<th>번호</th>
		<th></th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${dto.mb_level==2 }">
				<tr class="KingTr">
					<td>${(page - 1) * pageRows + status.index + 1 }</td>
					<td>공지</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }"; onclick="color()"; class="${(page - 1) * pageRows + status.index + 1 }";>${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
					</tr>
			</c:when>
		</c:choose>	
	</c:forEach>
	<c:forEach var="dto" items="${list }" varStatus="status">
		<c:choose>
			<c:when test="${dto.mb_level==1 }">
				<tr class="SubTr">
					<td>${(page - 1) * pageRows + status.index + 1 }</td>
					<td>건의</td>
					<td><a href="cview.do?uid=${dto.cwr_uid }&page=${page }"; onclick="color()"; class="${(page - 1) * pageRows + status.index + 1 }";>${dto.subject }</a></td>
					<td>${dto.mb_id }</td>
					<td>${dto.viewCnt }</td>
					<td>${dto.regDate }</td>
				</tr>
			</c:when>
		</c:choose>	
	</c:forEach>

		
</table>
<br>
<button onclick="location.href='cwrite.do?uid=${sessionScope.uid}'" class="New"><i class="fas fa-pencil-alt"></i></button>
<form action="logout.do">
<input type="submit" class="LogOutButton" value="&#xf011">
</form>
<form action="mainPage.do">
<input type="submit" value="&#xf015" class="MainPageButton">
</form>

<jsp:include page="cpagination.jsp">
	<jsp:param value="${writePages }" name="writePages"/>
	<jsp:param value="${totalPage }" name="totalPage"/>
	<jsp:param value="${page }" name="curPage"/>
</jsp:include>

</div>
</body>

		</html>

	</c:otherwise>
</c:choose>









