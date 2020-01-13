package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ToiletWriteDAO dao = new ToiletWriteDAO();

		// 입력한 값 받아오기
		int twr_uid = Integer.parseInt(request.getParameter("uid"));
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));
		
		// parameter 유효성 검증
		if (twr_uid != 0) {
			try {
				cnt = dao.deleteByUid(twr_uid, t_uid);
				request.setAttribute("del", cnt);
				request.setAttribute("t_uid", t_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
