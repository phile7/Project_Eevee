package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		// 입력한 값 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));

		// parameter 유효성 검증
		if (uid != 0) {
			try {
				cnt = dao.deleteByUid(uid);
				request.setAttribute("del", cnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
