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
	if(subject < 0.5){
		alert("0.5점 이상 입력하셔야합니다");
		frm["twr_score"].focus();
		return false;
	}
	return true;
}
</script>
<body>
<h2>글작성</h2>
<form name="frm" action="writeOk.tdo?uid=${sessionScope.uid}&t_uid=<%=t_uid %>" method="post" onsubmit="return chkSubmit()">
작성자:${sessionScope.id}<br>
제목:
<input type="text" name="subject"/><br>
별점:
<input type="text" name="twr_score"/><br>
내용:<br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,
		width: '800px',
		height: '400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload.do'
	});
</script>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.tdo?t_uid=<%=t_uid %>'">목록으로</button>
</body>

</html>





