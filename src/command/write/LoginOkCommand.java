package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class LoginOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String [] arr = new String [2];
		WriteDAO dao = new WriteDAO();
		int cnt = 0;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id != null && id.trim().length() > 0 && pw != null && pw.trim().length() > 0) {
			try {
				arr = dao.loginCheck(id, pw);
				if(arr[0].equals(pw)) {
					request.setAttribute("uid", arr[1]);
					request.setAttribute("level", arr[2]);
					cnt = 1;
					request.setAttribute("check", cnt);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
