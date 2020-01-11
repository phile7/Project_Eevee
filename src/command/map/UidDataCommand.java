package command.map;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import beans.toilet.*;

public class  UidDataCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		responseJSON(request, response);
		
	}
	
	
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		
		ToiletDAO dao = new ToiletDAO();
		double latitude = Double.parseDouble(request.getParameter("lat"));
		double longitude = Double.parseDouble(request.getParameter("lon"));
		int [] arr = null;
		int length = 0;
		
		// select된 결과 검증
		try {
			length = dao.getUid(latitude, longitude).length;
			//System.out.println(length);
			// 결과가 없거나 하나일 때
			if(length == 1) {
				dao = new ToiletDAO();
				arr = new int[1];
				arr = dao.getUid(latitude, longitude);
				// 만약 하나도 없다면 1칸 짜리 배열에 -9999값이 담긴다.
				arr[0] = arr[0] == -9999 ? -9999 : arr[0];
			// 결과가 하나 이상일 때
			} else {
				arr = new int[length];
				dao = new ToiletDAO();
				arr = dao.getUid(latitude, longitude);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}

		JSONObject jsonOutput = new JSONObject();		// 최종결과는 object
		
		JSONArray dataArr = new JSONArray();		// array
		for (int i = 0; i < arr.length; i++) {
			JSONObject dataObj = new JSONObject();
			dataObj.put("t_uid", arr[i]);
			dataArr.put(dataObj);
		}
		
		jsonOutput.put("location", dataArr);
		
		try {
			String jsonString = jsonOutput.toString();
			response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}