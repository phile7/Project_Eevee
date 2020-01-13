package controller.write;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.write.RankCommand;
import command.write.Command;
import command.write.CommentCommand;
import command.write.CommentCommandCenter;
import command.write.CommentToCommentCommand;
import command.write.CommentToCommentCommandCenter;
import command.write.DeleteCommand;
import command.write.DeleteCommandCenter;
import command.write.DeleteCommentCommand;
import command.write.DeleteCommentCommandCenter;
import command.write.FileUploadCommand;
import command.write.ListCommand;
import command.write.ListCommandCenter;
import command.write.LoginCmd;
import command.write.LoginWriteCmd;
import command.write.SelectCommand;
import command.write.SelectCommandCenter;
import command.write.UpdateCommand;
import command.write.UpdateCommandCenter;
import command.write.ViewCommand;
import command.write.ViewCommandCenter;
import command.write.WithdrawCommand;
import command.write.WriteListCommand;
import command.write.WriteOkCommand;
import command.write.WriteOkCommandCenter;

@WebServlet("*.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() 호출");

		request.setCharacterEncoding("UTF-8");

		Command command = null; // 어떠한 커맨드 수행할지.
		String viewPage = null; // 어떠한 페이지(view)

		// URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		// 1.커맨드 객체 수행
		switch (com) {
		
		// 회원로그인
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

		case "/logout.do":
			viewPage = "logIn/logout.jsp";
			break;
		
		// 회원 글보기
		case "/writelist.do":
			command = new WriteListCommand();
			command.execute(request, response);
			viewPage = "writelist/list.jsp";
			break;		
		
		// 회원 탈퇴
		case "/withdraw.do":
			command = new WithdrawCommand();
			command.execute(request, response);
			viewPage = "withdraw/withdraw.jsp";
			break;	
			
		// 메인페이지
		case "/mainPage.do":
			viewPage = "logIn/mainPage.jsp";
			break;
			
			
		// 지도
		case "/GPS/Map01.do":
			viewPage = "/GPS/Map01.jsp";
			break;
		
			
		// 놀이터 게시판
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
			
			
		// 고객센터 게시판
		case "/clist.do":
			command = new ListCommandCenter();
			command.execute(request, response);
			viewPage = "Center/list.jsp";
			break;
		case "/cwrite.do":
			viewPage = "Center/write.jsp";
			break;
		case "/cwriteOk.do":
			command = new WriteOkCommandCenter();
			command.execute(request, response);
			viewPage = "Center/writeOk.jsp";
			break;
		case "/cview.do":
			command = new ViewCommandCenter();
			command.execute(request, response);
			viewPage = "Center/view.jsp";
			break;
		case "/cdeleteOk.do":
			command = new DeleteCommandCenter();
			command.execute(request, response);
			viewPage = "Center/deleteOk.jsp";
			break;
		case "/cupdate.do":
			command = new SelectCommandCenter();
			command.execute(request, response);
			viewPage = "Center/update.jsp";
			break;
		case "/cupdateOk.do":
			command = new UpdateCommandCenter();
			command.execute(request, response);
			viewPage = "Center/updateOk.jsp";
			break;
		case "/cfileUpload.do":
			new FileUploadCommand().execute(request, response);
			break;
		case "/ccomment.do":
			command = new CommentCommandCenter();
			command.execute(request, response);
			viewPage = "Center/comment.jsp";
			break;
		case "/ccommentToComment.do":
			command = new CommentToCommentCommandCenter();
			command.execute(request, response);
			viewPage = "Center/commentToComment.jsp";
			break;
		case "/cdeleteCommentOk.do":
			command = new DeleteCommentCommandCenter();
			command.execute(request, response);
			viewPage = "Center/deleteCommentOk.jsp";
			break;
		
		// 랭킹보기
		case "/rlist.do":
			command = new RankCommand();
			command.execute(request, response);
			viewPage = "rank/list.jsp";
			break;	
			
		}
		// 2.View(*.jsp) 선택

		// 위에서 결정된 view 에 forward 해줌
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	}

}