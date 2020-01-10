package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class CommentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		String comment = request.getParameter("comment");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));
		int pwr_uid = Integer.parseInt(request.getParameter("pwr_uid"));

		// parameter 유효성 검증
		if (comment != null && comment.trim().length() > 0) {
			try {
				cnt = dao.insertComment(mb_uid, comment, pwr_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("pwr_uid", pwr_uid);
	}

}
