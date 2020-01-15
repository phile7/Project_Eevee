package beans.toilet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.OnlyContent;
import common.ToiletD;

public class ToiletContentDAO {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ToiletContentDAO() {
		try {
			Class.forName(OnlyContent.DRIVER);
			conn = DriverManager.getConnection(OnlyContent.URL, OnlyContent.USERID, OnlyContent.USERPW);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	
	
	// 특정 t_uid 의 정보만 가져오기
	public ToiletContentDTO[] selectByT_Uid(int t_uid) throws SQLException {
		ToiletContentDTO[] arr = null;
		ArrayList<ToiletContentDTO> list = new ArrayList<ToiletContentDTO>();

		try {
			pstmt = conn.prepareStatement(OnlyContent.SQL_SELECT_ONLY_CONTENT_FROM_TWRITE);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String content = rs.getString("twr_content").trim();
				if(content.equals("")) continue;
				list.add(new ToiletContentDTO(content));
			}
		} finally {
			close();
		}
		int size = list.size();
		if(size == 0) {
			arr = new ToiletContentDTO[1];
			arr[0] = new ToiletContentDTO("등록된 리뷰가 없습니다.");
			return arr;
		}
		arr = new ToiletContentDTO[size];
		list.toArray(arr);

		return arr;
	}
	

}
