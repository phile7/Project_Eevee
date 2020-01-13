package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.RankDAO;
import com.lec.beans.RankDTO;

public class RankCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		RankDAO dao = new RankDAO();
		RankDTO[] arr = null;

		try {
			arr = dao.select();

			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
