<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
    
<%
			request.setCharacterEncoding("utf-8");
			String code = null;
			if(request.getParameter("code") != null){
				code = request.getParameter("code");
			}
			
			UserDAO dao = new UserDAO();
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			
			if(userID == null){%>
			<script>
				alert("로그인을 해주세요");
				location.href = "login_1.do";
			</script>
<% return;}

		String userEmail = dao.getUserEmail(userID);
		boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
		
		dao = new UserDAO();
		
		if(isRight == true){ dao.setUserEmailChecked(userID);%>
			
			<script>
				alert("인증에 성공했습니다.");
				location.href = "login_1.do";
			</script>
<% return;} else {%>
			<script>
				alert("유효하지 않은 코드입니다..");
				location.href = "login_1.do";
			</script>
<% return;}
		

%>