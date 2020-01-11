package controller.write;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.log.Command;
import command.log.LoginCmd;
import command.log.LoginWriteCmd;




@WebServlet("*.do")
public class logController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public logController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("utf-8");
		
		Command command = null;	// 어떠한 명령어를 수행할지
		String viewPage = null;			// 어떠한 페이지(view)
		
		// URL 로 부터 URI, ContextPath, command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		// 테스트 출력
		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
		
		
		// 1. command 객체 수행
		switch(com) {
		
		case "/mainPage.do":
				viewPage = "logIn/mainPage.jsp";
				break;
		
		case "/login_1.do":
				viewPage = "logIn/login_1.jsp";
				break;
		
		case "/login_1OK.do":
				command = new LoginCmd();
				command.execute(request, response);
				viewPage = "logIn/login_1OK.jsp";
				break;
				
		case "/login_2.do":
				viewPage = "logIn/login_2.jsp";
				break;
		
		case "/login_3.do":
				viewPage = "logIn/login_3.jsp";
				break;
				
		case "/login_3Ok.do":
				command = new LoginWriteCmd();
				command.execute(request, response);
				viewPage = "logIn/login_3Ok.jsp";
				break;
				
		case "/login_sendEmail.do":
				viewPage = "logIn/login_sendEmail.jsp";
				break;
				
		case "/emailCheckAction.do":
				viewPage = "logIn/emailCheckAction.jsp";
				break;
				
				
		
				
		
		}
		
		
		// 2. view(*.jsp) 선택
		
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
	
}
