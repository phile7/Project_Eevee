<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>예제 메인</title>
</head>
<body>
반가워 메인페이지야~
sessionScope.uid : ${sessionScope.uid} <br>
sessionScope.id : ${sessionScope.id} <br>
sessionScope.level : ${sessionScope.level} <br>
<h2>로그인 상태입니다</h2>
<form action="logout.do">
<input type="submit" value="로그아웃"><br>
</form>	
<h2>화장실 uid 1번</h2>
<button onclick="location.href = 'list.tdo?t_uid=1'">화장실게시판</button>
<h2>회원 글목록</h2>
<button onclick="location.href = 'writelist.do?mb_uid=${sessionScope.uid}'">회원 글목록</button>
<h2>화장실 평점 랭킹</h2>
<button onclick="location.href = 'rlist.do'">화장실평점랭킹</button>
<h2>놀이터게시판</h2>
<form action="list.do">
<input type="submit" value="놀이터게시판"><br>
</form>	
<h2>고객센터</h2>
<form action="clist.do">
<input type="submit" value="고객센터"><br>
</form>

<script>
function chkDelete(id){
	// 삭제 여부 확인
	var r = confirm("정말 삭제하시겠습니까? 모든 회원정보가 지워집니다");
	
	if(r){
		location.href = 'withdraw.do?mb_uid=' + id;
	}
}
</script>
<h2>회원탈퇴</h2>
<button onclick="chkDelete(${sessionScope.uid})">회원탈퇴, 프론트엔드에서 한번 묻기</button>
</body>
</html>