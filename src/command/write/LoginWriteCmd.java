package command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;
import user.UserDTO;
import util.SHA256;

public class LoginWriteCmd implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserDAO dao = new UserDAO();
		int cnt = 0;
		
		String uid = request.getParameter("sid");
		String upw = request.getParameter("spw");
		String upw2 = request.getParameter("spw2");
		String uemail = request.getParameter("semail");
		
		if( uid != null && upw != null && upw2 != null && uemail != null 
				&& uid.trim().length() > 0 && upw.trim().length() > 0 
				&& upw2.trim().length() > 0 && uemail.trim().length() > 0
				&& upw.equals(upw2)) {
			
			try {
				
				cnt = dao.userInsert(new UserDTO(uid, upw, uemail, SHA256.getSHA256(uemail), false));
				
			}catch (Exception e) {
				e.printStackTrace();
				cnt = 2;	// 이미 아이디가 있는경우.
			}
		} else if (!upw.equals(upw2)) {
				cnt = -1;		// 비밀번호가 서로 다른경우.
		}
				
		request.setAttribute("result", cnt);	// 성공적으로 넘어오면 request에 "result" 라는 에트리뷰트에 cnt값 1을 담아 보내게 된다.
		
		if(cnt == 1) {
			request.setAttribute("userID", uid);
		}
		
		
	}
}
