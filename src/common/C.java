package common;

public interface C {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";


	//댓글
	public static final String SQL_COMMENT_INSERT_TO_PLAYGROUND = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 3)";

	public static final String SQL_COMMENT_TO_COMMENT_INSERT_TO_PLAYGROUND = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 4)";
	
	public static final String SQL_COMMENT_DELETE_BY_UID = "DELETE FROM comment WHERE co_uid = ?";

	//고객센터 게시판
	
	public static final String SQL_WRITE_INSERT = "INSERT INTO c_write" + "(cwr_subject, cwr_content, mb_uid) "
			+ "VALUES" + "(?, ?, ?)";
	
	public static final String SQL_COMMENT_SELECT_BY_UID_AT_PLAYGROUND = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (3) and co_puid = ?";

	public static final String SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_PLAYGROUND = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (4) and co_puid = ?";
	
	public static final String SQL_WRITE_SELECT = "select * from c_write, member where c_write.mb_uid = member.mb_uid ORDER BY cwr_uid DESC";

	public static final String SQL_WRITE_SELECT_BY_UID = "select * from c_write, member where c_write.mb_uid = member.mb_uid and cwr_uid = ?";

	public static final String SQL_WRITE_INC_VIEWCNT = "UPDATE c_write SET cwr_viewcnt = cwr_viewcnt + 1 WHERE cwr_uid = ?";

	public static final String SQL_WRITE_DELETE_BY_UID = "DELETE FROM c_write WHERE cwr_uid = ?";

	public static final String SQL_WRITE_UPDATE = "UPDATE c_write SET cwr_subject = ?, cwr_content = ? WHERE cwr_uid = ?";

	public static final String SQL_COUNT_ALL = "SELECT COUNT(*) FROM c_write";

	public static final String SQL_SELECT_FROM_ROW = "select * from c_write, member where c_write.mb_uid = member.mb_uid ORDER BY cwr_uid DESC LIMIT ?, ?";

}
