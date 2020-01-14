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
<script src="https://kit.fontawesome.com/129bd244d8.js" crossorigin="anonymous"></script>
<style type="text/css">
.container {
	width: 720px;
	height: 1300px;
	margin: 0 auto;
}

*{
font-size: 18px;}

.board{
background-color: #238556;
color: white;
text-align: center;
font-size: 20px;
padding: 8px;
font-weight: bold;
}

.title{background: #DDDDDD; padding: 8px;}

.subject{font-weight: bold;}

.mb_id{
	font-weight: bold;
	color: #238556;
}

.tab{
display: inline-block;
margin-left: 10px;}

.comment{
	background-color: #EEEEEE;
	border-radius: 10px;
	padding: 3px 15px;
	margin: 5px 0px;
}

.commenter{
	font-weight: bold;
}

.deletecomment{
	background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden; 
    color: red;
}

.buttons{
	background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    float: right;
    color: #238556;
}

.clear{clear: both;}

.commentinput{
	border: none;
	border-bottom: 1px solid #EEEEEE;
	margin: 0px auto;
}

.fa-replyd{
	color: #238556;
}

.replybtn{
	border:none;
	background:none;
}

#reply{
	size: 50px;
}
</style>
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
<div class="container"> 
	<div class="board">놀이터</div>
	<div class="title">
		<span class="subject">${read[0].subject }</span>
		<br>
		<span class="mb_id">${read[0].mb_id }</span><span class="tab"></span>	|<span class="tab"></span>
		${read[0].viewCnt } <span class="tab"></span>|<span class="tab"></span>	
		${read[0].regDate }
	</div>
	<div>${read[0].content }</div>
		<c:if
		test="${sessionScope.uid == read[0].mb_uid or sessionScope.level == 2}">
		<button class="buttons" onclick="chkDelete(${read[0].pwr_uid })">삭제하기</button>
		<button class="buttons" onclick="location.href = 'update.do?uid=${read[0].pwr_uid }'">수정하기</button>
	</c:if>
	<button class="buttons" onclick="location.href = 'list.do?page=${page}'">목록보기</button>
	<button class="buttons" onclick="location.href = 'write.do?uid=${sessionScope.uid}'">신규등록</button>
	<div class="clear"></div>
	<hr>
	<%
		int cnt = 0;
	%>
	<c:forEach var="dto" items="${comment }" varStatus="status">
		<div class="comment"> 
			<span class="commenter">${dto.mb_id }</span><span class="tab"></span>|<span class="tab"></span>
			<span>${dto.regDate }</span>
			<c:if test="${dto.co_depth == 1}">
			</c:if>
			<c:if test="${sessionScope.uid == dto.mb_uid or sessionScope.level == 2}">
			<button class="deletecomment" onclick="chkDeleteComment(${dto.co_uid })">삭제</button>
			</c:if>
			<div>${dto.comment }</div>
		</div> 
		<div class="clear"></div>
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
			for(int j = 0; j < indexCommentToComment; j++ ){
			if(comment[i].getCo_uid() == commentToComment[j].getCo_puid()) {
				String mb_id = commentToComment[j].getMb_id();
				String regDate = commentToComment[j].getRegDate();
				String commentValue = commentToComment[j].getComment();
		%>
			<div class="comment">
				<span class="commenter"><%=mb_id %></span> <span class="tab"></span>|<span class="tab"></span>
				<span><%=regDate %></span>
		<%
				if(loginId.equals(mb_id) || idLevel.equals("2")) {
		%>
					<button class="deletecomment" onclick="chkDeleteComment(${dto.co_uid })">삭제</button>
				<div><%=commentValue %></div>
			</div>
		<%
				}
			}
		}
		cnt++;
		break;
		}
		%>
		<form class="commentsection" name="form" 
			action="commentToComment.do?uid=${sessionScope.uid}&co_uid=${dto.co_uid}&pwr_uid=${read[0].pwr_uid}"
			method="post" onsubmit="return chkSubmitCommentToComment()">
			<input class="commentinput" type="text" name="comment" style="width: 670px" /> <button class="replybtn"
				type="submit"><i class="fab fa-replyd fa-lg"></i></button>				
		</form>
		<hr>
	</c:forEach>

	<form name="frm"
		action="comment.do?uid=${sessionScope.uid}&pwr_uid=${read[0].pwr_uid}"
		method="post" onsubmit="return chkSubmitComment()">
		<input class="commentinput" type="text" name="comment" style="width: 670px" /> <button class="replybtn"
				type="submit"><i class="fab fa-replyd fa-lg"></i></button>				
	</form>
	<hr>
	
</div>
</body>
		</html>

	</c:otherwise>
</c:choose>









