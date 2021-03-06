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
<title>${read[0].subject }</title>
<script src="https://kit.fontawesome.com/129bd244d8.js"; crossorigin="anonymous"></script>
<style type="text/css">
body{
	padding: 0px;
	margin: 0px;
}

.container {
	width: 720px;
	height: 1300px;
	margin: 0 auto;
}

#tong2 {
	position:relative;
	width: 720px;
	margin: 0 auto;
	top: 65px;
	height: 700px;
}

*{
font-size: 25px;}

.board{
	width:720px;
	height:65px;
	line-height: 65px;
	background-color: #238556;
	color: white;
	text-align: center;
	font-size: 30px;
	padding: 0;
	font-weight: bold;
}

.title{
	background: #DDDDDD; 
	padding: 0 0 0 10px;
	
	}

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
	border-radius: 0;
	padding: 10px 0 10px 30px;
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



#btjari{
	position:absolute;
	width: 720px;
	height: 90px;
	top: 220px;
	
}

#btjari #golist{
	position:absolute;
	right: 30px;
	width: 81px;
	height: 81px;
	background: url(toilet/CSS/list1.png) center center no-repeat;
}

#btjari #del{
	position:absolute;
	right: 120px;
	width: 81px;
	height: 81px;
	background:url(toilet/CSS/del.png) center center no-repeat;
}
#btjari #upd{
	position:absolute;
	right: 210px;
	width: 81px;
	height: 81px;
	background:url(toilet/CSS/upd.png) center center no-repeat;
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

#comen {
	display: block;
	width: 720px;
	height: 50px;
	top: 300px;
}

.replybtn {
		font-size: 20px;
		width: 70px;
		height: 40px;
		border: 1px solid black;
		cursor: pointer;
		
}

</style>
</head>
<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.tdo?uid=' + id + '&t_uid=' + ${read[0].t_uid};
	}
}

function chkDeleteComment(id){
	// 삭제 여부 확인
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteCommentOk.tdo?uid=' + id + '&twr_uid=' + ${read[0].twr_uid} + '&t_uid=' + ${read[0].t_uid};
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
	<div style="width: 100px; height: 65px;"></div>
	<div class="board" id="titl">화장실 리뷰</div>
	<div class="title">
	<span class="subject">${read[0].subject }</span>
	<br>
	<span class="mb_id">${read[0].mb_id }</span>
	<span class="tab"></span>	|<span class="tab"></span>
	${read[0].twr_score }
	<span class="tab"></span>	|<span class="tab"></span>
	${read[0].viewCnt }
	<span class="tab"></span>|<span class="tab"></span>
	${read[0].regDate }
	</div>
		<div style="width: 100px; height: 100px;"></div>
		<div>${read[0].content }</div>
		<div style="width: 100px; height: 100px;"></div>
	<div id="btjari">
		<c:if
		test="${sessionScope.uid == read[0].mb_uid or sessionScope.level == 2}">
		<button id="del" class="buttons" onclick="chkDelete(${read[0].twr_uid })"></button>
		<button id="upd" class="buttons" onclick="location.href = 'update.tdo?uid=${read[0].twr_uid }&t_uid=${read[0].t_uid }'"></button>
	</c:if>
	<button id="golist" class="buttons" onclick="location.href = 'list.tdo?t_uid=${read[0].t_uid }&page=${page}'"></button>
	<!-- <button onclick="location.href = 'write.tdo?uid=${sessionScope.uid}&t_uid=${read[0].t_uid }'">신규등록</button> -->
	</div>
	<div class="clear"></div>
	<hr>
	<%
		int cnt = 0;
	%>
	<c:forEach var="dto" items="${comment }" varStatus="status">
		<div class="comment"> 
			<span class="commenter">${dto.mb_id }</span><span class="tab"></span>|<span class="tab"></span>
			<span>${dto.regDate }</span>
			<c:if test="${sessionScope.uid == dto.mb_uid or sessionScope.level == 2}">
			<button class="deletecomment" onclick="chkDeleteComment(${dto.co_uid })">삭제</button>
			</c:if>
			<c:if test="${dto.co_depth == 5}">
			<div>${dto.comment }</div>
			</c:if>
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
				<span class="commenter">ㄴ    <%=mb_id %></span><span class="tab"></span>|<span class="tab"></span>
				<span><%=regDate %></span>
		<%
				if(loginId.equals(mb_id) || idLevel.equals("2")) {
		%>
					<button class="deletecomment" onclick="chkDeleteComment(${dto.co_uid })">삭제</button>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;<%=commentValue %></div>
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
			action="commentToComment.tdo?uid=${sessionScope.uid}&co_uid=${dto.co_uid}&twr_uid=${read[0].twr_uid}&t_uid=${read[0].t_uid}"
			method="post" onsubmit="return chkSubmitCommentToComment()" style="padding: 0 0 0 30px;">
			<input class="commentinput" type="text" name="comment" style="width: 600px" /> 
			<button class="replybtn" type="submit">댓글</button>	
		</form>
		<hr>
	</c:forEach>
	<br>

	<form name="frm"
		action="comment.tdo?uid=${sessionScope.uid}&twr_uid=${read[0].twr_uid}&t_uid=${read[0].t_uid}"
		method="post" onsubmit="return chkSubmitComment()">
			<input class="commentinput" type="text" name="comment" style="width: 630px;" /> 
			<button class="replybtn"; type="submit">댓글</button>	
	</form>
<hr>
	
</div>
</body>
		</html>

	</c:otherwise>
</c:choose>









