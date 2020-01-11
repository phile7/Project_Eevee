package command.log;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

public class LoginCmd implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		UserDAO dao = new UserDAO();
		int cnt = 0;
		
		String uid = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(uid != null && pw != null && uid.trim().length() > 0 && pw.trim().length() > 0) {
			
			try {
				
				cnt = dao.login(uid, pw);
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		request.setAttribute("result", cnt);
		
		

		
		
	}	// end execute
	
}	// end class
