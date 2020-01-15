<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글작성</title>
<script src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="playground/CSS/pwrite.css"/>
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
	return true;
}
</script>
<body>
<div id="sec">
	<div style="width: 100px; height: 60px;"></div>
	<h2 id="pwtt">글 작 성</h2>
	<div id="intro">
			<form name="frm" action="writeOk.do?uid=${sessionScope.uid}" method="post" onsubmit="return chkSubmit()">
			<div id="subj">	
				작성자: ${sessionScope.id}<br>
				제목:
				<input type="text" name="subject" style="font-size: 25px;"/><br>
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
		<button id="listgo" type="button" onclick="location.href='list.do'"></button>
	</div>
		</form>
	</div>
		
	</div>				

</body>

</html>





