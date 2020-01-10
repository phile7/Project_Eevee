package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CommentDTO;
import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO[] arr = null;
		CommentDTO[] arrComment = null;

		// 입력한 값 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		// 페이징
		int page = 1;
		String param = request.getParameter("page");
		if(param != null) page = Integer.parseInt(param);
		
		// parameter 유효성 검증
		if (uid != 0) {
			try {
				arr = dao.readByUid(uid);
				request.setAttribute("read", arr);
				request.setAttribute("page", page); // 페이징
				arrComment = dao.commentRead(uid);
				request.setAttribute("comment", arrComment);
				request.setAttribute("commentToComment", arrComment);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
