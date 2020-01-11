package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.Session;

import common.D;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public UserDAO() {
			try {
				
				// 마리아 디비 지정해주고
				Class.forName(D.DRIVER);
				
				// 마리아 디비에 url, id, pw 정보 기입해서 연결
				conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}	// UserDAO() end
	
	public void close() throws SQLException {
		
		// 자원들 반납해주는 메소드
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}	// close() end
	
	// insert
	public int userInsert(UserDTO user) throws Exception{
		int cnt = 0;
		
		try {
			
			// sql 실행해서 set값 변경 해주고, 성공적으로 되면 이번같은 경우는 cnt에 1이 들어갈것이다
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			
			pstmt.setString(1, user.getUid());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getEmailHash());
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// login
	public String [] login(String id, String pw) throws SQLException{
		String cnt = "0";
		String uid = "";
		String level = "";
		try {
			
			pstmt = conn.prepareStatement(D.SQL_SELECT_BY_IDPW);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("mb_password").equals(pw) && rs.getBoolean("mb_emailSign") == true ) {
					cnt = "1";
					uid = rs.getString("mb_uid");
					level = rs.getString("mb_level");
					String [] arr = {cnt, uid, level};
					return arr; // 로그인 성공
				} else if (!rs.getString("mb_password").equals(pw)){
					String [] arr = {cnt, uid, level};
					return arr;	// 비밀번호 다름
				} else if(rs.getString("mb_password").equals(pw) && rs.getBoolean("mb_emailSign") == false) {
					cnt = "-2";
					String [] arr = {cnt, uid, level};
					return arr;
				}
			}
			cnt = "-1";
			String [] arr = {cnt, uid, level};
					return arr; // 아이디가 없음
		} finally {
			close();
		}
		
	}	// login end
	
	// emailget
	public String getUserEmail(String userID) throws SQLException {
		
		String email = "";
		
		try {
			
			pstmt = conn.prepareStatement(D.SQL_SELECT_BY_IDEMAIL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				email = rs.getString(1);
				return email;
			}
	
		} finally {
			close();
		}
	
	return null;
		
		
	}	// end emailget
	
	
	// emailCheck
	public boolean getUserEmailChecked(String userID) throws SQLException{
		
			try {
			
					pstmt = conn.prepareStatement(D.SQL_SELECT_BY_IDEMAILCK);
					pstmt.setString(1, userID);
					rs= pstmt.executeQuery();
					
					if(rs.next()) {
						return rs.getBoolean(1);
					}
			
				} finally {
					close();
				}
			
			return false;
		
	}	// getUserEmailChecked end
	
	public boolean setUserEmailChecked(String userID) throws SQLException{
		
		int cnt = 0;
		
		try {
		
				pstmt = conn.prepareStatement(D.SQL_UPDATE_BY_IDEMAILCK);
				pstmt.setString(1, userID);
				cnt = pstmt.executeUpdate();
				
				if(cnt == 1) {
					return true;
				} else {
					return false;
				}
				
			} finally {
				close();
			}
	
	}	// setUserEmailChecked end
	
	
	
	
}	// class end
