package common;

public interface P {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";


	//댓글
	public static final String SQL_COMMENT_INSERT_TO_PLAYGROUND = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 1)";

	public static final String SQL_COMMENT_TO_COMMENT_INSERT_TO_PLAYGROUND = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 2)";
	
	public static final String SQL_COMMENT_DELETE_BY_UID = "DELETE FROM comment WHERE co_uid = ?";
	
	public static final String SQL_COMMENT_COUNT_BY_UID = "select count(*) from comment where comment.co_depth = 1 and comment.co_puid = ?";
	
	//회원가입
	
	public static final String SQL_SELECT_PW_FROM_ID = "select mb_password from member where mb_id = ?";
	
	public static final String SQL_SELECT_UID_FROM_ID = "select mb_uid, mb_level from member where mb_id = ?";
	
	//놀이터 게시판
	
	public static final String SQL_WRITE_INSERT = "INSERT INTO p_write" + "(pwr_subject, pwr_content, mb_uid) "
			+ "VALUES" + "(?, ?, ?)";
	
	public static final String SQL_COMMENT_SELECT_BY_UID_AT_PLAYGROUND = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (1) and co_puid = ?";

	public static final String SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_PLAYGROUND = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (2) and co_puid = ?";
	
	public static final String SQL_WRITE_SELECT = "select * from p_write, member where p_write.mb_uid = member.mb_uid ORDER BY pwr_uid DESC";

	public static final String SQL_WRITE_SELECT_BY_UID = "select * from p_write, member where p_write.mb_uid = member.mb_uid and pwr_uid = ?";

	public static final String SQL_WRITE_INC_VIEWCNT = "UPDATE p_write SET pwr_viewcnt = pwr_viewcnt + 1 WHERE pwr_uid = ?";

	public static final String SQL_WRITE_DELETE_BY_UID = "DELETE FROM p_write WHERE pwr_uid = ?";

	public static final String SQL_WRITE_UPDATE = "UPDATE p_write SET pwr_subject = ?, pwr_content = ? WHERE pwr_uid = ?";

	public static final String SQL_COUNT_ALL = "SELECT COUNT(*) FROM p_write";

	public static final String SQL_SELECT_FROM_ROW = "select * from p_write, member where p_write.mb_uid = member.mb_uid ORDER BY pwr_uid DESC LIMIT ?, ?";
	
	

}
