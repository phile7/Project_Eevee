package command.map;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.json.JSONArray;
import org.json.JSONObject;

import beans.toilet.*;


public class AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		responseJSON(request, response);

		// parameter
		String t_uid = request.getParameter("t_uid");
		
	}  // end execute()

	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		ToiletDTO [] dtoArr = (ToiletDTO [])request.getAttribute("data");
		
		JSONObject jsonOutput = new JSONObject();		// 최종결과는 object
		
		// 데이터 개수
		int count = (dtoArr == null) ? 0 : dtoArr.length;
		
		// 데이터 목록
		JSONArray dataArr = new JSONArray();		// array
		for(int i = 0; i < count; i++) {
			JSONObject dataObj = new JSONObject();
			
			dataObj.put("t_uid", dtoArr[i].getT_uid());
			dataObj.put("t_name", dtoArr[i].getT_name());
			dataObj.put("t_location", dtoArr[i].getT_location());
			dataObj.put("t_location_o", dtoArr[i].getT_location_o());
			dataObj.put("t_latitude", dtoArr[i].getT_latitude());
			dataObj.put("t_longitude", dtoArr[i].getT_longitude());
			dataObj.put("t_gender", dtoArr[i].getT_gender());
			dataObj.put("t_kid_M", dtoArr[i].getT_kid_M());
			dataObj.put("t_kid_W", dtoArr[i].getT_kid_W());
			dataObj.put("t_disabled_M", dtoArr[i].getT_disabled_M());
			dataObj.put("t_disabled_W", dtoArr[i].getT_disabled_W());
			dataObj.put("t_count_M", dtoArr[i].getT_count_M());
			dataObj.put("t_count_W", dtoArr[i].getT_count_W());
			
			dataArr.put(dataObj);
		}
		
		jsonOutput.put("Datalist", dataArr);
		
		try {
		String jsonString = jsonOutput.toString();
		response.setContentType("application/json; charset=utf-8"); 
			response.getWriter().write(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
