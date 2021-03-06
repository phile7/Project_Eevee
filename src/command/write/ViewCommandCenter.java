package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CommentDTO;
import com.lec.beans.CenterDAO;
import com.lec.beans.CenterDTO;

public class ViewCommandCenter implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CenterDAO dao = new CenterDAO();
		CenterDTO[] arr = null;
		CommentDTO[] arrComment = null;
		CommentDTO[] arrCommentToComment = null;

		// 입력한 값 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		// 페이징
		int page = 1;
		String param = request.getParameter("page");
		if(param != null) page = Integer.parseInt(param);
		
		// parameter 유효성 검증
		if (uid != 0) {
			try {
				arr = dao.readByUid(uid);
				request.setAttribute("read", arr);
				request.setAttribute("page", page); // 페이징
				arrComment = dao.commentRead(uid);
				request.setAttribute("comment", arrComment);
				for (int i = 0; i < arrComment.length; i++) {
					arrCommentToComment = null;
					arrCommentToComment = dao.commentToCommentRead(arrComment[i].getCo_uid());
					if(arrCommentToComment != null) {
						request.setAttribute("commentToComment" + i, arrCommentToComment);
						request.setAttribute("indexCommentToComment" + i, arrCommentToComment.length);
					}
				}
				request.setAttribute("indexComment", arrComment.length);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
