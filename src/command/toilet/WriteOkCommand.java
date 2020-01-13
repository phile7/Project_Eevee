package command.toilet;


import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;
import com.lec.beans.ToiletWriteDTO;
import com.lec.beans.WriteDAO;

public class WriteOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ToiletWriteDAO dao = new ToiletWriteDAO();

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));
		double twr_score = Double.parseDouble(request.getParameter("twr_score"));
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));

		// parameter 유효성 검증
		if (subject != null && subject.trim().length() > 0 && cnt != 2) {
			try {
				cnt = dao.insert(subject, content, mb_uid, twr_score, t_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("t_uid", t_uid);
	}

}
