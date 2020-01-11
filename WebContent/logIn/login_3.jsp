<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 정보 입력</title>
<link rel="stylesheet" href="css/login_1.css">
</head>

<script>
// form 검증
function chkSubmit(){
	frm = document.forms["sform"];
	
	var sid = frm["sid"].value.trim();
	var spw = frm["spw"].value.trim();
	var spw2 = frm["spw2"].value.trim();
	var semail = frm["semail"].value.trim();
	
	if(sid == ""){
		alert("ID 란은 반드시 입력해야 합니다");
		frm["sid"].focus();
		return false;
	}
	if(spw == ""){
		alert("비밀번호는 반드시 작성해야 합니다");
		frm["spw"].focus();
		return false;
	}
	if(spw2 == ""){
		alert("비밀번호 확인은 반드시 작성해야 합니다");
		frm["spw2"].focus();
		return false;
	}
	if(semail == ""){
		alert("이메일은 반드시 작성해야 합니다");
		frm["semail"].focus();
		return false;
	}
	
	return true;
}

</script>

<body>
<div class="sign">
    <a id="back" href="login_1.do"></a>
    
    <form id="sform2" name="sform" action="login_3Ok.do" method="post" onsubmit="return chkSubmit()">
        <input type="text" class="sid" name="sid" placeholder="아이디">
        <input type="password" class="spw" name="spw" placeholder="비밀번호">
        <input type="password" class="spw2" name="spw2" placeholder="비밀번호 확인">
        <input type="email" class="semail" name="semail" placeholder="이메일">
        <input type="submit" class="ssub" value="">
    </form>
    

</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/login_1.js"></script>
</html>