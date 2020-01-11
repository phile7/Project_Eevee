package command.map;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.toilet.*;

public class DataCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ToiletDAO dao = new ToiletDAO();
		ToiletDTO [] arr = null;
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));  // 매개변수 검증 필요
		
		try {
			arr = dao.selectByUid(t_uid);
			request.setAttribute("data", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
