package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;

public class DeleteCommentCommandCenter implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CenterDAO dao = new CenterDAO();

		int uid = Integer.parseInt(request.getParameter("uid"));
		int cwr_uid = Integer.parseInt(request.getParameter("cwr_uid"));

		if (uid != 0) {
			try {
				cnt = dao.deleteCommentByUid(uid);
				request.setAttribute("del", cnt);
				request.setAttribute("cwr_uid", cwr_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
