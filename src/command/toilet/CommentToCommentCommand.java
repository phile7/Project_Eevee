package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;

public class CommentToCommentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ToiletWriteDAO dao = new ToiletWriteDAO();

		String comment = request.getParameter("comment");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));
		int co_uid = Integer.parseInt(request.getParameter("co_uid"));
		int twr_uid = Integer.parseInt(request.getParameter("twr_uid"));
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));

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
		request.setAttribute("twr_uid", twr_uid);
		request.setAttribute("t_uid", t_uid);

	}

}
