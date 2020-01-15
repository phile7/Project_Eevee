<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="com.lec.beans.*" %>  
<%
	int t_uid = Integer.parseInt(request.getParameter("t_uid"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글작성</title>
<script src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="toilet/CSS/twrite.css"/>
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	var subject = frm["subject"].value.trim();
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	var score = frm["twr_score"].value.trim();
	if(subject < 0.5 or subject > 5){
		alert("0.5점 이상, 5점 이하로 입력하셔야합니다");
		frm["twr_score"].focus();
		return false;
	}
	return true;
}
</script>
<body>
<div id="sec">
	<div style="width: 100px; height: 60px;"></div>
	<h2 id="pwtt">글 작 성</h2>
	<div id="intro">
<form name="frm" action="writeOk.tdo?uid=${sessionScope.uid}&t_uid=<%=t_uid %>" method="post" onsubmit="return chkSubmit()">
			<div id="subj">	
				<div style="display : none">작성자: ${sessionScope.id}</div>
				제목:
				<input type="text" name="subject" style="font-size: 20px;"/><br>
				별점:
				<input type="text" name="twr_score" style="font-size: 20px;"/><br>
		    </div>
	</div>
			<textarea name="content" id="editor1"></textarea>
			<script>
				CKEDITOR.replace('editor1', {
					allowedContent: true,
					width: '718px',
					height: '400px',
					filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload.do'
				});
				</script>
	<div id="btctl">
		<input id="subbt" type="submit" value=""/>

<button id="listgo" type="button" onclick="location.href='list.tdo?t_uid=<%=t_uid %>'"></button>
</body>

</html>





