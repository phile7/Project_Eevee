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
</head>
<script src="ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="toilet/CSS/tupdate.css"/>
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
<div id="sec">
	<div style="width: 100px; height: 60px;"></div>
	<h2 id="pwtt">수정하기</h2>
	<div id="intro">
		<form name="frm" action="updateOk.tdo?uid=${sel[0].twr_uid}&t_uid=${sel[0].t_uid}" method="post" onsubmit="return chkSubmit()">
<div id="subj">
<input type="hidden" name="uid" value="${sel[0].twr_uid }"/>
제목 : 
<input type="text" name="subject" value="${sel[0].subject }" style="font-size: 20px;"><br>
별점 : 
<input type="text" name="twr_score" value="${sel[0].twr_score }" style="font-size: 20px;"><br>
				</div>
	</div>
<textarea name="content" id="editor1"> ${sel[0].content }</textarea>
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
		<button onclick="location.href = 'list.tdo?${sel[0].t_uid}'" id="listgo"></button>
	</div>
	</form>
	</div>
		
	</div>				

</body>

</html>

	
	</c:otherwise>
</c:choose>   















