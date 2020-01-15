package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import common.P;
import common.T;
import common.W;

public class ToiletWriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ToiletWriteDAO() {

		try {
			Class.forName(T.DRIVER);
			conn = DriverManager.getConnection(T.URL, T.USERID, T.USERPW);
			System.out.println("ToiletWriteDAO 객체 생성, 데이터베이스 연결");
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

	// 새글 작성 <-- 제목, 내용, mb_uid
	// INSERT
	public int insert(ToiletWriteDTO dto) throws SQLException {
		String subject = dto.getSubject();
		String content = dto.getContent();
		int mb_uid = dto.getMb_uid();
		int t_uid = dto.getT_uid();
		double twr_score = dto.getTwr_score();

		return this.insert(subject, content, mb_uid, twr_score, t_uid);
	}

	public int insert(String subject, String content, int mb_uid, double twr_score, int t_uid) throws SQLException {
		int cnt = 0;
		int ts_uid = 0;
		try {
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_MAKE_DUMMY);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_COUNT);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			ts_uid = rs.getInt(1); // 첫번째 컬럼
			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_WRITE_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, mb_uid);
			pstmt.setDouble(4, twr_score);
			pstmt.setInt(5, t_uid);
			pstmt.setInt(6, ts_uid);
			cnt = pstmt.executeUpdate();
			pstmt.close();			
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_SELECT);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			double totalScore = 0.0;
			int chk = 0;
			while(rs.next()) {
				chk++;
				totalScore += rs.getDouble("twr_score");
			}
			double ts_score = totalScore/chk;
			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_UPDATE);
			pstmt.setDouble(1, ts_score);
			pstmt.setInt(2, t_uid);
			pstmt.setInt(3, ts_uid);
			pstmt.executeUpdate();
			
		} finally {
			close();
		}

		return cnt;
	}

	// ResultSet --> DTO 배열로 변환 리턴
	public ToiletWriteDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<ToiletWriteDTO> list = new ArrayList<ToiletWriteDTO>();

		while (rs.next()) {
			int twr_uid = rs.getInt("twr_uid");
			int mb_uid = rs.getInt("mb_uid");
			int t_uid = rs.getInt("t_uid");
			int ts_uid = rs.getInt("ts_uid");
			double twr_score = rs.getDouble("twr_score");
			double ts_score = rs.getDouble("ts_score");
			String mb_id = rs.getString("mb_id");
			String subject = rs.getString("twr_subject");
			String content = rs.getString("twr_content");
			if (content == null)
				content = "";
			int viewCnt = rs.getInt("twr_viewcnt");
			Date d = rs.getDate("twr_regdate");
			Time t = rs.getTime("twr_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d);

			ToiletWriteDTO dto = new ToiletWriteDTO(twr_uid, mb_uid, t_uid, ts_uid, twr_score, ts_score, mb_id, subject, content, viewCnt, regdate);
			list.add(dto);
		}

		int size = list.size();
		ToiletWriteDTO[] arr = new ToiletWriteDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 글 목록 읽어오기
	// SELECT
	public ToiletWriteDTO[] select(int mb_uid) throws SQLException {
		ToiletWriteDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(W.SQL_WRITE_LIST_FROM_TOILET);
			pstmt.setInt(1, mb_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 uid 의 글만 읽어오기
	public ToiletWriteDTO[] selectByUid(int t_uid, int twr_uid) throws SQLException {
		ToiletWriteDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(T.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, t_uid);
			pstmt.setInt(2, twr_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}

	// 특정 uid 의 글만 읽어오기 + 조회수 증가
	// SELECT, UPDATE
	public ToiletWriteDTO[] readByUid(int t_uid, int twr_uid) throws SQLException {
		int cnt = 0;
		ToiletWriteDTO arr[] = null;

		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);

			// 쿼리문(들) 실행
			pstmt = conn.prepareStatement(T.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, twr_uid);
			cnt = pstmt.executeUpdate();

			pstmt.close();
			pstmt = conn.prepareStatement(T.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, t_uid);
			pstmt.setInt(2, twr_uid);
			rs = pstmt.executeQuery();

			arr = createArray(rs);

			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
			throw e;
		} finally {
			pstmt.close();
		}

		return arr;
	}

	// 특정 uid 의 글을 삭제하기
	// DELETE
	public int deleteByUid(int twr_uid, int t_uid) throws SQLException {
		int cnt = 0;
		int ts_uid = 0;
		
		try {
			pstmt = conn.prepareStatement(T.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, twr_uid);
			cnt = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_MAKE_DUMMY);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_COUNT);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			ts_uid = rs.getInt(1); // 첫번째 컬럼
			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_SELECT);
			pstmt.setInt(1, t_uid);
			rs = pstmt.executeQuery();
			double totalScore = 0.0;
			int chk = 0;
			while(rs.next()) {
				chk++;
				totalScore += rs.getDouble("twr_score");
			}
			double ts_score = 0.0;
			if(chk != 0) {
				ts_score = totalScore/chk;
			}

			pstmt.close();
			
			pstmt = conn.prepareStatement(T.SQL_SCORE_UPDATE);
			pstmt.setDouble(1, ts_score);
			pstmt.setInt(2, t_uid);
			pstmt.setInt(3, ts_uid);
			pstmt.executeUpdate();
			
		} finally {
			close();
		}

		return cnt;
	}

	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int twr_uid, String subject, Double twr_score, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(T.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setDouble(3, twr_score);
			pstmt.setInt(4, twr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 페이징
	
	// 몇번째 페이지부터 몇개의 rows를 select
	public ToiletWriteDTO [] selectFromRow(int t_uid, int from, int rows) throws SQLException {
		ToiletWriteDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(T.SQL_SELECT_FROM_ROW);
			pstmt.setInt(1, t_uid);
			pstmt.setInt(2, from);
			pstmt.setInt(3, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	// 총 몇개의 글이 있는지 계산
	public int countAll() throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(T.SQL_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			cnt = rs.getInt(1); // 첫번째 컬럼
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 댓글

	// 글마다 댓글 개수 확인

	public int[] countComment(ToiletWriteDTO[] arr) {
		int[] comment = new int[arr.length];
		for (int i = 0; i < comment.length; i++) {
			try {
				pstmt = conn.prepareStatement(T.SQL_COMMENT_COUNT_BY_UID);
				pstmt.setInt(1, arr[i].getTwr_uid());
				this.rs = pstmt.executeQuery();
				this.rs.next();
				comment[i] = this.rs.getInt(1);
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comment;
	}
	// 댓글등록
	public int insertComment(int mb_uid, String comment, int twr_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(T.SQL_COMMENT_INSERT_TO_TOILET);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, comment);
			pstmt.setInt(3, twr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}
	// 특정 글 클릭시 댓글도 불러오기
	public CommentDTO[] createCommentArray(ResultSet rs) throws SQLException {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();

		while (rs.next()) {
			int co_uid = rs.getInt("co_uid");
			int co_puid = rs.getInt("co_puid");
			int mb_uid = rs.getInt("mb_uid");
			String mb_id = rs.getString("mb_id");
			int co_depth = rs.getInt("co_depth");
			String comment = rs.getString("co_content");
			if (comment == null)
				comment = "";
			Date d = rs.getDate("co_regdate");
			Time t = rs.getTime("co_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t);

			CommentDTO dto = new CommentDTO(co_uid, co_puid, mb_uid, mb_id, co_depth, comment, regdate);
			list.add(dto);
		}

		int size = list.size();
		CommentDTO[] arr = new CommentDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	public CommentDTO[] commentRead(int twr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(T.SQL_COMMENT_SELECT_BY_UID_AT_TOILET);
			pstmt.setInt(1, twr_uid);
			rs = pstmt.executeQuery();
			arr = createCommentArray(rs);
		} finally {
			
		}

		return arr;
	}
	
	public CommentDTO[] commentToCommentRead(int twr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(T.SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_TOILET);
			pstmt.setInt(1, twr_uid);
			rs = pstmt.executeQuery();
			arr = createCommentArray(rs);
		} finally {
			pstmt.close();
		}

		return arr;
	}

	// 댓글 삭제
	public int deleteCommentByUid(int co_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(T.SQL_COMMENT_DELETE_BY_UID);
			pstmt.setInt(1, co_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}
	//대댓글 등록
	public int insertCommentToComment(int mb_uid, String comment, int co_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(T.SQL_COMMENT_TO_COMMENT_INSERT_TO_TOILET);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, comment);
			pstmt.setInt(3, co_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}
	// 회원탈퇴시
	// DELETE
	public int deleteMember(int mb_uid) throws SQLException {
		int cnt = 0;
		
		try {
			
			pstmt = conn.prepareStatement(W.SQL_USER_WRITE_DELETE_AT_TOILET);
			pstmt.setInt(1, mb_uid);
			cnt = pstmt.executeUpdate();
			
		} finally {
			pstmt.close();
		}

		return cnt;
	}
	
}
