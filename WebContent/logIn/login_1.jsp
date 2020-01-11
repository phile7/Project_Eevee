<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>인트로</title>
<link rel="stylesheet" href="css/login_1.css">  
</head>

<script>
// form 검증
function chkSubmit(){
	frm = document.forms["form1"];
	
	var id = frm["id"].value.trim();
	var pw = frm["pw"].value.trim();
	
	
	if(id == ""){
		alert("ID를 입력해 주세요");
		frm["id"].focus();
		return false;
	}
	if(pw == ""){
		alert("비밀번호를 입력해 주세요");
		frm["pw"].focus();
		return false;
	}
	
	
	return true;
}

</script>

<body>
    <div class="logo">
        <div id="garim"></div>
        <div id="garim2">
        </div>
        <form id="form" name = "form1" action="login_1OK.do" method="post" onsubmit="return chkSubmit()">
            <input type="text" class="inputid" name="id" placeholder="아이디">
            <input type="password" class="inputpw" name="pw" placeholder="비밀번호">
            <input type="submit" class="submit" value="">
        </form>
        <a id="hg" href="login_2.do"></a>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/login_1.js"></script>
</html>