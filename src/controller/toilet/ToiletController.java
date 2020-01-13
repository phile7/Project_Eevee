package controller.toilet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.toilet.Command;
import command.toilet.CommentCommand;
import command.toilet.CommentToCommentCommand;
import command.toilet.DeleteCommand;
import command.toilet.DeleteCommentCommand;
import command.toilet.FileUploadCommand;
import command.toilet.ListCommand;
import command.toilet.SelectCommand;
import command.toilet.UpdateCommand;
import command.toilet.ViewCommand;
import command.toilet.WriteOkCommand;



@WebServlet("*.tdo")
public class ToiletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ToiletController() {
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
					
		// 화장실 게시판
		case "/list.tdo":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "toilet/list.jsp";
			break;
		case "/write.tdo":
			viewPage = "toilet/write.jsp";
			break;
		case "/writeOk.tdo":
			command = new WriteOkCommand();
			command.execute(request, response);
			viewPage = "toilet/writeOk.jsp";
			break;
		case "/view.tdo":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "toilet/view.jsp";
			break;
		case "/deleteOk.tdo":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "toilet/deleteOk.jsp";
			break;
		case "/update.tdo":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "toilet/update.jsp";
			break;
		case "/updateOk.tdo":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "toilet/updateOk.jsp";
			break;
		case "/fileUpload.tdo":
			new FileUploadCommand().execute(request, response);
			break;
		case "/comment.tdo":
			command = new CommentCommand();
			command.execute(request, response);
			viewPage = "toilet/comment.jsp";
			break;
		case "/commentToComment.tdo":
			command = new CommentToCommentCommand();
			command.execute(request, response);
			viewPage = "toilet/commentToComment.jsp";
			break;
		case "/deleteCommentOk.tdo":
			command = new DeleteCommentCommand();
			command.execute(request, response);
			viewPage = "toilet/deleteCommentOk.jsp";
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