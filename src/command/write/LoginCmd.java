package command.write;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

public class LoginCmd implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		UserDAO dao = new UserDAO();
		String [] arr = null;
		
		String uid = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(uid != null && pw != null && uid.trim().length() > 0 && pw.trim().length() > 0) {
			
			try {
				
				arr = dao.login(uid, pw);
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		request.setAttribute("result", arr[0]);
		request.setAttribute("uid", arr[1]);
		request.setAttribute("level", arr[2]);
		
		

		
		
	}	// end execute
	
}	// end class
