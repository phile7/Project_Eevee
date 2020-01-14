package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.C;
import common.R;

public class RankDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public RankDAO() {

		try {
			Class.forName(R.DRIVER);
			conn = DriverManager.getConnection(R.URL, R.USERID, R.USERPW);
			System.out.println("CenterDAO 객체 생성, 데이터베이스 연결");
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

	// 랭킹목록
	public RankDTO[] select() throws SQLException {
		ArrayList<Integer> list = new ArrayList<Integer>();
		ArrayList<RankDTO> dtolist = new ArrayList<RankDTO>();
		
		try {
			pstmt = conn.prepareStatement(R.SQL_UID_SELECT);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			pstmt.close();
			
			pstmt = conn.prepareStatement(R.SQL_SCORE_SELECT);
			for (int i = 0; i < list.size(); i++) {
				pstmt.setInt(1, list.get(i));
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int t_uid = rs.getInt("t_uid");
					String t_name = rs.getString("t_name");
					String t_location_O = rs.getString("t_location_O");
					String t_location = rs.getString("t_location");
					double ts_score = Math.round(rs.getDouble("ts_score")*100)/100.0;

					RankDTO dto = new RankDTO(t_uid, t_name, t_location_O, t_location, ts_score);
					dtolist.add(dto);
				}
			}
			int size = dtolist.size();
			RankDTO[] arr = new RankDTO[size];
			dtolist.toArray(arr);
			
			RankDTO dummy = null;
			for (int i = 0; i < arr.length-1;) {
				if(arr[i].getTs_score() < arr[i+1].getTs_score()) {
					dummy = arr[i];
					arr[i] = arr[i+1];
					arr[i+1] = dummy;
					i = -1;
				}
				i++;
			}
			
			return arr;
			
		} finally {
			close();
		}
	}
}
