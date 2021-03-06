package command.toilet;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ToiletWriteDAO;
import com.lec.beans.ToiletWriteDTO;
import com.lec.beans.WriteDAO;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ToiletWriteDAO dao = new ToiletWriteDAO();
		ToiletWriteDTO [] arr = null;
		
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));
		
		// 페이징 관련 세팅 값들
		int page = 1; // 현재 페이지 (디폴트 1 page)
		int writePages = 5; // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?, 페이징: 밑 페이지 수
		int pageRows = 15; // 한 '페이지' 에 몇개의 글을 리스트업 할 것인가?
		int totalPage = 0; // 총 몇 '페이지' 분량인가?
		int cnt = 0; // 글은 총 몇개인가?
		
		// 현재 페이지 request로 부터 넘어온거 받아오기 (파라미터 검증)
		String param = request.getParameter("page");
		if(param != null && !param.trim().equals("")) {
			try {
				page = Integer.parseInt(param);
			} catch(NumberFormatException e) {
				// 별도의 처리는 안함
			}
		}
		
		try {
			// 글 전체 개수 구하기
			cnt = dao.countAll(t_uid);
			
			// 총 몇페이지 분량인가?
			totalPage = (int)Math.ceil(cnt / (double)pageRows); //소수 올림
			
			// 몇번째 row 부터?
			int fromRow = (page - 1) * pageRows; // MySQL은 0부터 시작
			
			dao = new ToiletWriteDAO();
			arr = dao.selectFromRow(t_uid, fromRow, pageRows);
			
			dao = new ToiletWriteDAO();
			int [] arrComment = dao.countComment(arr);
			
			request.setAttribute("list", arr);
			request.setAttribute("cnt", cnt);
			request.setAttribute("t_uid", t_uid);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			request.setAttribute("arrComment", arrComment);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
