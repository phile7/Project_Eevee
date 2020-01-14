package common;

public interface T {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";


	//댓글
	public static final String SQL_COMMENT_INSERT_TO_TOILET = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 5)";

	public static final String SQL_COMMENT_TO_COMMENT_INSERT_TO_TOILET = "INSERT INTO comment" + "(mb_uid, co_content, co_puid, co_depth) "
			+ "VALUES" + "(?, ?, ?, 6)";
	
	public static final String SQL_COMMENT_DELETE_BY_UID = "DELETE FROM comment WHERE co_uid = ?";

	public static final String SQL_COMMENT_COUNT_BY_UID = "select count(*) from comment where comment.co_depth = 5 and comment.co_puid = ?";
	
	//화장실 게시판 랭킹 연동
	
	public static final String SQL_SCORE_MAKE_DUMMY = "INSERT INTO t_score" + "(ts_score, t_uid) "
			+ "VALUES" + "(1, ?)";
	
	public static final String SQL_SCORE_COUNT = "SELECT COUNT(*) FROM t_score";
	
	public static final String SQL_SCORE_SELECT = "select twr_score from t_write where t_uid = ?";	
	
	public static final String SQL_SCORE_UPDATE = "UPDATE t_score SET ts_score = ?, t_uid = ? WHERE ts_uid = ?";	
	
	//화장실 게시판
	
	public static final String SQL_WRITE_INSERT = "INSERT INTO t_write" + "(twr_subject, twr_content, mb_uid, twr_score, t_uid, ts_uid) "
			+ "VALUES" + "(?, ?, ?, ?, ?, ?)";
	
	public static final String SQL_COMMENT_SELECT_BY_UID_AT_TOILET = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (5) and co_puid = ?";

	public static final String SQL_COMMENT_TO_COMMENT_SELECT_BY_UID_AT_TOILET = "select * from comment, member where comment.mb_uid = member.mb_uid and co_depth in (6) and co_puid = ?";
	
	public static final String SQL_WRITE_SELECT = "select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and t_write.t_uid = ?) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) ORDER BY twr_uid desc";

	public static final String SQL_WRITE_SELECT_BY_UID = "select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and t_write.t_uid = ?) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) and twr_uid = ?";

	public static final String SQL_WRITE_INC_VIEWCNT = "UPDATE t_write SET twr_viewcnt = twr_viewcnt + 1 WHERE twr_uid = ?";

	public static final String SQL_WRITE_DELETE_BY_UID = "DELETE FROM t_write WHERE twr_uid = ?";

	public static final String SQL_WRITE_UPDATE = "UPDATE t_write SET twr_subject = ?, twr_content = ?, twr_score = ? WHERE twr_uid = ?";

	public static final String SQL_COUNT_ALL = "SELECT COUNT(*) FROM t_write";

	public static final String SQL_SELECT_FROM_ROW = "select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and t_write.t_uid = ?) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) ORDER BY twr_uid desc LIMIT ?, ?";


}
