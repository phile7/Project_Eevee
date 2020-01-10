package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		
		// 입력한 값 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		// parameter 유효성 검증
		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.update(uid, subject, content);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("upd", cnt);

	}

}
