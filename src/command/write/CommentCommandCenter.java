package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;

public class CommentCommandCenter implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CenterDAO dao = new CenterDAO();

		String comment = request.getParameter("comment");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));
		int cwr_uid = Integer.parseInt(request.getParameter("cwr_uid"));

		// parameter 유효성 검증
		if (comment != null && comment.trim().length() > 0) {
			try {
				cnt = dao.insertComment(mb_uid, comment, cwr_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("cwr_uid", cwr_uid);
	}

}
