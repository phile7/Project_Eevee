<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글작성</title>

<script src="ckeditor/ckeditor.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Center/CSS/write.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

<div class="MainDiv">

<form name="frm" action="cwriteOk.do?uid=${sessionScope.uid}" method="post" onsubmit="return chkSubmit()">
<p class="p1">작성자 :&nbsp;</p><p class="p2">${sessionScope.id}</p><br>
<p class="p3">제목 :&nbsp;</p><input type="text" name="subject" class="subject"/><br><br>

<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,
		width: '720px',
		height: '500px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/cfileUpload.do'
	});
</script>
<br><br>
<input type="submit"  class="goWrite" value="&#xf040">
</form>
<br>
<button type="button" onclick="location.href='clist.do'" class="goList"><i class="fas fa-home"></i></button>

</div>

</body>

</html>





