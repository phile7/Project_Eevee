<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL 사용하면 import의 번잡함이 감소, java 변수선언 감소 JSP태그 번잡함 감소-->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>랭킹</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="rank/CSS/rank.css"/>

</head>

<body style="width: 720px; height: 1300px; position: relative; margin: auto;">
<div class="MainDiv"></div>
<form action="mainPage.do">
<input type="submit" value="" class="MainPageButton">
</form>

   <c:forEach var="dto" items="${list }" begin="0" end="2" varStatus="status">
      <div class="RankDiv${status.count}">
      	<div class="RankImg${status.count}"></div>
      	<div class="RankName${status.count}"><p>${dto.t_name }</p></div>
      	<div class="RankPost${status.count}"></div>
         <div class="Rank${status.count}-${status.count+0}"><p>${dto.t_name }</p></div>
         <div class="Rank${status.count}-${status.count+1}"><p>${dto.t_location }</p></div>
         <div class="Rank${status.count}-${status.count+2}"><p>평점 : ${dto.ts_score }</p></div>
      </div>
   </c:forEach>
   
   <div class="fireKing">
   		<div class="fireQueen">
   			<div class="fire-01" id="fire-001"></div>
   			<div class="fire-01" id="fire-002"></div>
   			<div class="fire-01" id="fire-003"></div>
   			<div class="fire-01" id="fire-004"></div>
   		</div>
   </div>
   
   <div class="Comment1"><p>항상 휴지가 걸려있어요 !</p></div>
   <div class="Comment2"><p>2번째칸 비데있음</p></div>
   <div class="Comment3"><p>온수 나와용~</p></div>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="rank/JS/rank1.js" type="text/javascript"></script>

</html>







