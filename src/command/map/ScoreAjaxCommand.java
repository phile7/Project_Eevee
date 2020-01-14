package command.map;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.toilet.*;

public class ScoreAjaxCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		jsonExecute(request, response);
	}
	
	public void jsonExecute(HttpServletRequest request, HttpServletResponse response){
		ToiletScoreDAO dao = new ToiletScoreDAO();
		double score = 0;
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));  // 매개변수 검증 필요
		int mb_uid = Integer.parseInt(request.getParameter("mb_uid"));  // 매개변수 검증 필요
		
		try {
			score = dao.selectScore(mb_uid, t_uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonOutput = new JSONObject();		// 최종결과는 object
		
		jsonOutput.put("score", score);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
