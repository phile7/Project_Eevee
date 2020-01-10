package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class DeleteCommentCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		int uid = Integer.parseInt(request.getParameter("uid"));
		int pwr_uid = Integer.parseInt(request.getParameter("pwr_uid"));

		if (uid != 0) {
			try {
				cnt = dao.deleteCommentByUid(uid);
				request.setAttribute("del", cnt);
				request.setAttribute("pwr_uid", pwr_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
