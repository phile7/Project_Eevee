package beans.toilet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.ToiletD;

public class ToiletDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ToiletDAO() {

		try {
			Class.forName(ToiletD.DRIVER);
			conn = DriverManager.getConnection(ToiletD.URL, ToiletD.USERID, ToiletD.USERPW);
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

	// ResultSet --> DTO 배열로 변환 리턴
	public ToiletDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<ToiletDTO> list = new ArrayList<ToiletDTO>();

		while (rs.next()) {
			int t_uid = rs.getInt("t_uid");
			String t_name = rs.getString("t_name");
			String t_location = rs.getString("t_location");
			String t_location_o = rs.getString("t_location_o");
			double t_latitude = rs.getDouble("t_latitude");
			double t_longitude = rs.getDouble("t_longitude");
			int t_gender = rs.getInt("t_gender");
			int t_kid_M = rs.getInt("t_kid_M");
			int t_kid_W = rs.getInt("t_kid_W");
			int t_disabled_M = rs.getInt("t_disabled_M");
			int t_disabled_W = rs.getInt("t_disabled_W");
			int t_count_M = rs.getInt("t_count_M");
			int t_count_W = rs.getInt("t_count_W");

			ToiletDTO dto = new ToiletDTO(t_uid, t_name, t_location, t_location_o, t_latitude, t_longitude, t_gender, t_kid_M,
					t_kid_W, t_disabled_M, t_disabled_W, t_count_M, t_count_W);
			list.add(dto);
		}

		int size = list.size();
		ToiletDTO[] arr = new ToiletDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 정보 가져오기
	// SELECT
	public ToiletDTO[] select() throws SQLException {
		ToiletDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(ToiletD.SQL_TOILET_INFO_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 t_uid 의 정보만 가져오기
	public ToiletDTO[] selectByUid(int t_uid) throws SQLException {
		ToiletDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(ToiletD.SQL_TOILET_INFO_SELECT_BY_UID);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}

	public int[] getUid(double latitude, double longitude) throws SQLException {
		int i = 0;
		int[] arr = null;
		ArrayList<Integer> array = new ArrayList<Integer>();
		try {
			pstmt = conn.prepareStatement(ToiletD.SQL_GET_UID_BY_LATITUDE_LONGITUDE);
			pstmt.setDouble(1, latitude);
			pstmt.setDouble(2, longitude);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int t_uid = rs.getInt("t_uid");
				array.add(t_uid);
				i++;
			}
			
			arr = new int[array.size()];
			
			// 근처 화장실 없으면 NullPointerException발생, 막아줌
			if(i == 0) {
				arr = new int[1];
				arr[0] = -9999;
			}

			
			for (int j = 0; j < array.size(); j++) {
				arr[j] = array.get(j).intValue();
			}

			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			close();
		}

		return arr;
	}

} // end class
