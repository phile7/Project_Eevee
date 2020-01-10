package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO[] arr = null;

		// 입력한 값 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));

		// parameter 유효성 검증
		if (uid != 0) {
			try {
				arr = dao.selectByUid(uid);
				request.setAttribute("sel", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
