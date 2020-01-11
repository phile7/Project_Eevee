package controller.write;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import command.write.Command;
import command.write.CommentCommand;
import command.write.CommentToCommentCommand;
import command.write.DeleteCommand;
import command.write.DeleteCommentCommand;
import command.write.FileUploadCommand;
import command.write.ListCommand;
import command.write.LoginCmd;
import command.write.LoginOkCommand;
import command.write.LoginWriteCmd;
import command.write.SelectCommand;
import command.write.UpdateCommand;
import command.write.ViewCommand;
import command.write.WriteOkCommand;

@WebServlet("*.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = null; // 어떠한 커맨드 수행할지.
		String viewPage = null;  // 어떠한 페이지(view)
		
		//URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		
		// 1.커맨드 객체 수행
		switch(com) {
		case "/login.do":
			viewPage = "playground/login.jsp";
			break;
		case "/loginOk.do":
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "playground/loginOk.jsp";
			break;
		case "/logout.do":
			viewPage = "playground/logout.jsp";
			break;
		case "/list.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "playground/list.jsp";
			break;
		case "/write.do":
			viewPage = "playground/write.jsp";
			break;
		case "/writeOk.do":
			command = new WriteOkCommand();
			command.execute(request, response);
			viewPage = "playground/writeOk.jsp";
			break;
		case "/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "playground/view.jsp";
			break;
		case "/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "playground/deleteOk.jsp";
			break;
		case "/update.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "playground/update.jsp";
			break;
		case "/updateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "playground/updateOk.jsp";
			break;
		case "/fileUpload.do":
			new FileUploadCommand().execute(request, response);
			break;
		case "/comment.do":
			command = new CommentCommand();
			command.execute(request, response);
			viewPage = "playground/comment.jsp";
			break;
		case "/commentToComment.do":
			command = new CommentToCommentCommand();
			command.execute(request, response);
			viewPage = "playground/commentToComment.jsp";
			break;
		case "/deleteCommentOk.do":
			command = new DeleteCommentCommand();
			command.execute(request, response);
			viewPage = "playground/deleteCommentOk.jsp";
			break;
		
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
				
		case "/GPS/Map01.do":
			viewPage = "/GPS/Map01.jsp";
			break;
			
		}
		
		
		
		// 2.View(*.jsp) 선택
		
		// 위에서 결정된 view 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
		
	}
	

}