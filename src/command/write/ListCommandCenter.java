package command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CenterDAO;
import com.lec.beans.CenterDTO;

public class ListCommandCenter implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CenterDAO dao = new CenterDAO();
		CenterDTO [] arr = null;
		
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
			cnt = dao.countAll();
			
			// 총 몇페이지 분량인가?
			totalPage = (int)Math.ceil(cnt / (double)pageRows); //소수 올림
			
			// 몇번째 row 부터?
			int fromRow = (page - 1) * pageRows; // MySQL은 0부터 시작
			
			dao = new CenterDAO();
			arr = dao.selectFromRow(fromRow, pageRows);
			
			request.setAttribute("list", arr);
			request.setAttribute("cnt", cnt);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
