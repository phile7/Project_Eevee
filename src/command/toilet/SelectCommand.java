package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;
import com.lec.beans.ToiletWriteDTO;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ToiletWriteDAO dao = new ToiletWriteDAO();
		ToiletWriteDTO [] arr = null;

		// 입력한 값 받아오기
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));
		int twr_uid = Integer.parseInt(request.getParameter("uid"));

		// parameter 유효성 검증
		if (twr_uid != 0) {
			try {
				arr = dao.selectByUid(t_uid, twr_uid);
				request.setAttribute("sel", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
