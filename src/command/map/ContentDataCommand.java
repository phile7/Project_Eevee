package command.map;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.toilet.*;

public class ContentDataCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		jsonExecute(request, response);
	}
	
	public void jsonExecute(HttpServletRequest request, HttpServletResponse response){
		ToiletContentDAO dao = new ToiletContentDAO();
		ToiletContentDTO [] arr = null;
		int t_uid = Integer.parseInt(request.getParameter("t_uid"));  // 매개변수 검증 필요
		int length = 0;
		
		try {
			length = dao.selectByT_Uid(t_uid).length;
			if(length == 1) {
				dao = new ToiletContentDAO();
				arr = new ToiletContentDTO[1];
				arr = dao.selectByT_Uid(t_uid);
			}
			else {
				dao = new ToiletContentDAO();
				arr = new ToiletContentDTO[length];
				arr = dao.selectByT_Uid(t_uid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonOutput = new JSONObject();		// 최종결과는 object
		
		JSONArray dataArr = new JSONArray();		// array
		for (int i = 0; i < arr.length; i++) {
			JSONObject dataObj = new JSONObject();
			dataObj.put("twr_content", arr[i].getTwr_content());
			dataArr.put(dataObj);
			if(i == 14) break;
		}
		
		jsonOutput.put("twr_content", dataArr);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
