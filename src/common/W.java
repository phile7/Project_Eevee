package common;

public interface W {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	//회원 글 목록 가져오기
	public static final String SQL_WRITE_LIST_FROM_TOILET = "select * from t_write, member, t_score where (t_write.mb_uid = member.mb_uid and member.mb_uid = ?) and (t_write.t_uid = t_score.t_uid and t_score.ts_uid = (select max(ts_uid) from t_score)) ORDER BY twr_uid desc";
	
	public static final String SQL_WRITE_LIST_FROM_PLAYGROUND = "select * from p_write, member where member.mb_uid = ? and p_write.mb_uid = member.mb_uid ORDER BY pwr_uid DESC";
		
	public static final String SQL_WRITE_LIST_FROM_CENTER = "select * from c_write, member where member.mb_uid = ? and c_write.mb_uid = member.mb_uid ORDER BY cwr_uid DESC";
	
	//회원탈퇴
	
	public static final String SQL_USER_WRITE_DELETE_AT_TOILET = "DELETE FROM t_write WHERE mb_uid = ?";

	public static final String SQL_USER_WRITE_DELETE_AT_PLAYGROUND = "DELETE FROM p_write WHERE mb_uid = ?";

	public static final String SQL_USER_WRITE_DELETE_AT_CENTER = "DELETE FROM c_write WHERE mb_uid = ?";

	public static final String SQL_USER_WRITE_DELETE_AT_COMMENT = "DELETE FROM comment WHERE mb_uid = ?";

	public static final String SQL_USER_INFO_DELETE = "DELETE FROM member WHERE mb_uid = ?";
}
