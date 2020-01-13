package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;

public class DeleteCommentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ToiletWriteDAO dao = new ToiletWriteDAO();

		int uid = Integer.parseInt(request.getParameter("uid"));
		int twr_uid = Integer.parseInt(request.getParameter("twr_uid"));
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));

		if (uid != 0) {
			try {
				cnt = dao.deleteCommentByUid(uid);
				request.setAttribute("del", cnt);
				request.setAttribute("twr_uid", twr_uid);
				request.setAttribute("t_uid", t_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
