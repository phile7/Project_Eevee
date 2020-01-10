package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class CommentToCommentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		String comment = request.getParameter("comment");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));
		int pwr_uid = Integer.parseInt(request.getParameter("pwr_uid"));

		// parameter 유효성 검증
		if (comment != null && comment.trim().length() > 0) {
			try {
				cnt = dao.insertCommentToComment(mb_uid, comment, co_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("co_uid", co_uid);
		request.setAttribute("pwr_uid", pwr_uid);

	}

}
