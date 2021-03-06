package beans.toilet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.S;
import common.ToiletD;

public class ToiletScoreDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ToiletScoreDAO() {

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

	// select score
	public double selectScore(int t_uid) throws SQLException {
		double score = 0;
		try {
			pstmt = conn.prepareStatement("SELECT ts_score FROM t_score WHERE t_uid = ? ORDER BY ts_uid DESC");
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				score = rs.getDouble("ts_score");
				System.out.println(score);
				break;
			}
		} finally {
			close();
		}
		return score;
	}
	
	
} // end class
