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

public class WriteDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public WriteDAO() {

		try {
			Class.forName(P.DRIVER);
			conn = DriverManager.getConnection(P.URL, P.USERID, P.USERPW);
			System.out.println("WriteDAO 객체 생성, 데이터베이스 연결");
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
	public int insert(WriteDTO dto) throws SQLException {
		String subject = dto.getSubject();
		String content = dto.getContent();
		int mb_uid = dto.getMb_uid();

		return this.insert(subject, content, mb_uid);
	}

	public int insert(String subject, String content, int mb_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(P.SQL_WRITE_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, mb_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// ResultSet --> DTO 배열로 변환 리턴
	public WriteDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();

		while (rs.next()) {
			int pwr_uid = rs.getInt("pwr_uid");
			int mb_uid = rs.getInt("mb_uid");
			String mb_id = rs.getString("mb_id");
			String subject = rs.getString("pwr_subject");
			String content = rs.getString("pwr_content");
			if (content == null)
				content = "";
			int viewCnt = rs.getInt("pwr_viewcnt");
			Date d = rs.getDate("pwr_regdate");
			Time t = rs.getTime("pwr_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t);

			WriteDTO dto = new WriteDTO(pwr_uid, mb_uid, mb_id, subject, content, viewCnt, regdate);
			list.add(dto);
		}

		int size = list.size();
		WriteDTO[] arr = new WriteDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 글 목록 읽어오기
	// SELECT
	public WriteDTO[] select() throws SQLException {
		WriteDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(P.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 uid 의 글만 읽어오기
	public WriteDTO[] selectByUid(int pwr_uid) throws SQLException {
		WriteDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(P.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, pwr_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}

	// 특정 uid 의 글만 읽어오기 + 조회수 증가
	// SELECT, UPDATE
	public WriteDTO[] readByUid(int pwr_uid) throws SQLException {
		int cnt = 0;
		WriteDTO arr[] = null;

		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);

			// 쿼리문(들) 실행
			pstmt = conn.prepareStatement(P.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, pwr_uid);
			cnt = pstmt.executeUpdate();

			pstmt.close();
			pstmt = conn.prepareStatement(P.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, pwr_uid);
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
	public int deleteByUid(int pwr_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(P.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, pwr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int pwr_uid, String subject, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(P.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, pwr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 페이징
	
	// 몇번째 페이지부터 몇개의 rows를 select
	public WriteDTO [] selectFromRow(int from, int rows) throws SQLException {
		WriteDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(P.SQL_SELECT_FROM_ROW);
			pstmt.setInt(1, from);
			pstmt.setInt(2, rows);
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
			pstmt = conn.prepareStatement(P.SQL_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			cnt = rs.getInt(1); // 첫번째 컬럼
		} finally {
			close();
		}
		
		return cnt;
	}
	//로그인 확인
	public String [] loginCheck(String id, String pw) throws SQLException {
		String uid = "";
		String level = "";
		try {
			pstmt = conn.prepareStatement(P.SQL_SELECT_PW_FROM_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			pw = rs.getString(1); // 첫번째 컬럼		
			pstmt.close();
			
			//해당 아이디 uid, 관리자권한 가져오기
			pstmt = conn.prepareStatement(P.SQL_SELECT_UID_FROM_ID);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			uid = rs.getString(1);
			level = rs.getString(2);
		} finally {
			close();
		}
		
		String [] arr = {pw, uid, level};
		return arr;
	}
	
	// 댓글
	
	// 댓글등록
	public int insertComment(int mb_uid, String comment, int pwr_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(P.SQL_COMMENT_INSERT_TO_PLAYGROUND);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, comment);
			pstmt.setInt(3, pwr_uid);
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
	
	public CommentDTO[] commentRead(int pwr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(P.SQL_COMMENT_SELECT_BY_UID_AT_PLAYGROUND);
			pstmt.setInt(1, pwr_uid);
			rs = pstmt.executeQuery();
			arr = createCommentArray(rs);
		} finally {
			
		}

		return arr;
	}
	
	public CommentDTO[] commentToCommentRead(int pwr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(P.SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_PLAYGROUND);
			pstmt.setInt(1, pwr_uid);
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
			pstmt = conn.prepareStatement(P.SQL_COMMENT_DELETE_BY_UID);
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
			pstmt = conn.prepareStatement(P.SQL_COMMENT_TO_COMMENT_INSERT_TO_PLAYGROUND);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, comment);
			pstmt.setInt(3, co_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}
	
} // end class
