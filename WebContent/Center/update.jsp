<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:choose>
	<c:when test="${empty sel || fn:length(sel) == 0}">
		<script>
			alert("해당정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 ${upd[0].subject }</title>

<script src="ckeditor/ckeditor.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="Center/CSS/update.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<script src="ckeditor/ckeditor.js"></script>
<script>
// form 검증
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
<%--내용 과 제목만 수정 가능. submit 하기전에 검증 --%>
<form name="frm" action="cupdateOk.do" 
	method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="${sel[0].cwr_uid }"/>	
<p class="p1">작성자 :&nbsp;</p><p class="p2">${sel[0].mb_id }</p><br>  <%-- 작성자 이름은 변경 불가 --%>
<p class="p3">제목 :&nbsp;</p><input type="text" class="subject" name="subject" value="${sel[0].subject }"><br><br>
<textarea name="content" id="editor1"> ${sel[0].content }</textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,
		width: '720px',
		height: '500px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/cfileUpload.do'
	});
</script>

<input type="submit" class="goUpload" value="&#xf040"/>
</form>

<button onclick="history.back()" class="goBefore"><i class="fas fa-arrow-left"></i></button>
<button onclick="location.href = 'clist.do'" class="goList"><i class="fas fa-home"></i></button>

</div>
</body>
</html>
	
	</c:otherwise>
</c:choose>    
