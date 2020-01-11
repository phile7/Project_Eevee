package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;

public class WriteOkCommandCenter implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CenterDAO dao = new CenterDAO();

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int mb_uid = Integer.parseInt(request.getParameter("uid"));

		// parameter 유효성 검증
		if (subject != null && subject.trim().length() > 0 && cnt != 2) {
			try {
				cnt = dao.insert(subject, content, mb_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
	}

}
