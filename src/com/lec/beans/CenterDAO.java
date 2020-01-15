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

import common.C;
import common.W;

public class CenterDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public CenterDAO() {

		try {
			Class.forName(C.DRIVER);
			conn = DriverManager.getConnection(C.URL, C.USERID, C.USERPW);
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

	// 새글 작성 <-- 제목, 내용, mb_uid
	// INSERT
	public int insert(CenterDTO dto) throws SQLException {
		String subject = dto.getSubject();
		String content = dto.getContent();
		int mb_uid = dto.getMb_uid();

		return this.insert(subject, content, mb_uid);
	}

	public int insert(String subject, String content, int mb_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(C.SQL_WRITE_INSERT);
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
	public CenterDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<CenterDTO> list = new ArrayList<CenterDTO>();

		while (rs.next()) {
			int cwr_uid = rs.getInt("cwr_uid");
			int mb_uid = rs.getInt("mb_uid");
			int mb_level = rs.getInt("mb_level");
			String mb_id = rs.getString("mb_id");
			String subject = rs.getString("cwr_subject");
			String content = rs.getString("cwr_content");
			if (content == null)
				content = "";
			int viewCnt = rs.getInt("cwr_viewcnt");
			Date d = rs.getDate("cwr_regdate");
			String regdate = new SimpleDateFormat("yyyy-MM-dd").format(d);

			CenterDTO dto = new CenterDTO(cwr_uid, mb_uid, mb_level, mb_id, subject, content, viewCnt, regdate);
			list.add(dto);
		}

		int size = list.size();
		CenterDTO[] arr = new CenterDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 글 목록 읽어오기
	// SELECT
	public CenterDTO[] select(int mb_uid) throws SQLException {
		CenterDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(W.SQL_WRITE_LIST_FROM_CENTER);
			pstmt.setInt(1, mb_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 uid 의 글만 읽어오기
	public CenterDTO[] selectByUid(int cwr_uid) throws SQLException {
		CenterDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(C.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, cwr_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}

	// 특정 uid 의 글만 읽어오기 + 조회수 증가
	// SELECT, UPDATE
	public CenterDTO[] readByUid(int cwr_uid) throws SQLException {
		int cnt = 0;
		CenterDTO arr[] = null;

		try {
			// 트랜잭션 처리
			conn.setAutoCommit(false);

			// 쿼리문(들) 실행
			pstmt = conn.prepareStatement(C.SQL_WRITE_INC_VIEWCNT);
			pstmt.setInt(1, cwr_uid);
			cnt = pstmt.executeUpdate();

			pstmt.close();
			pstmt = conn.prepareStatement(C.SQL_WRITE_SELECT_BY_UID);
			pstmt.setInt(1, cwr_uid);
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
	public int deleteByUid(int cwr_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(C.SQL_WRITE_DELETE_BY_UID);
			pstmt.setInt(1, cwr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 특정 uid 의 글을 수정하기 --> 제목, 내용
	// UPDATE
	public int update(int cwr_uid, String subject, String content) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(C.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, cwr_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 페이징
	
	// 몇번째 페이지부터 몇개의 rows를 select
	public CenterDTO [] selectFromRow(int from, int rows) throws SQLException {
		CenterDTO [] arr = null;
		try {
			pstmt = conn.prepareStatement(C.SQL_SELECT_FROM_ROW);
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
			pstmt = conn.prepareStatement(C.SQL_COUNT_ALL);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행의
			cnt = rs.getInt(1); // 첫번째 컬럼
		} finally {
			close();
		}
		
		return cnt;
	}
	
	// 댓글
	
	// 댓글등록
	public int insertComment(int mb_uid, String comment, int cwr_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(C.SQL_COMMENT_INSERT_TO_PLAYGROUND);
			pstmt.setInt(1, mb_uid);
			pstmt.setString(2, comment);
			pstmt.setInt(3, cwr_uid);
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
	
	public CommentDTO[] commentRead(int cwr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(C.SQL_COMMENT_SELECT_BY_UID_AT_PLAYGROUND);
			pstmt.setInt(1, cwr_uid);
			rs = pstmt.executeQuery();
			arr = createCommentArray(rs);
		} finally {
			
		}

		return arr;
	}
	
	public CommentDTO[] commentToCommentRead(int cwr_uid) throws SQLException {
		CommentDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(C.SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_PLAYGROUND);
			pstmt.setInt(1, cwr_uid);
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
			pstmt = conn.prepareStatement(C.SQL_COMMENT_DELETE_BY_UID);
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
			pstmt = conn.prepareStatement(C.SQL_COMMENT_TO_COMMENT_INSERT_TO_PLAYGROUND);
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
	// 회원 uid 의 글을 삭제하기
	public int deleteMember(int mb_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(W.SQL_USER_WRITE_DELETE_AT_CENTER);
			pstmt.setInt(1, mb_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}

		return cnt;
	}
	
	// 회원 댓글 삭제
	public int deleteMemberComment(int mb_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(W.SQL_USER_WRITE_DELETE_AT_COMMENT);
			pstmt.setInt(1, mb_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			pstmt.close();
		}

		return cnt;
	}
} // end class
