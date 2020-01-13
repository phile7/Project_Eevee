package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ToiletWriteDAO dao = new ToiletWriteDAO();
		
		// 입력한 값 받아오기
		int twr_uid = Integer.parseInt(request.getParameter("uid"));
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		double twr_score = Double.parseDouble(request.getParameter("twr_score"));
		
		// parameter 유효성 검증
		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.update(twr_uid, subject, twr_score, content);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("upd", cnt);
		request.setAttribute("t_uid", t_uid);
		request.setAttribute("twr_uid", twr_uid);

	}

}
