package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;
import com.lec.beans.CenterDTO;
import com.lec.beans.ToiletWriteDAO;
import com.lec.beans.ToiletWriteDTO;
import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class WriteListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//회원글목록
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));
		
		WriteDAO writedao = new WriteDAO();
		ToiletWriteDAO toiletdao = new ToiletWriteDAO();
		CenterDAO centerdao = new CenterDAO();
		WriteDTO [] arrWrite = null;
		ToiletWriteDTO [] arrToilet = null;
		CenterDTO [] arrCenter = null;
		
		try {
			arrWrite = writedao.select(mb_uid);
			arrToilet = toiletdao.select(mb_uid);
			arrCenter = centerdao.select(mb_uid);
			
			request.setAttribute("arrWrite", arrWrite);
			request.setAttribute("arrToilet", arrToilet);
			request.setAttribute("arrCenter", arrCenter);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}

