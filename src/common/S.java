package common;

public interface S {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 1, 2 : mb_uid
	// 3 : t_uid
	public static final String SQL_SELECT_SCORE_BY_JOIN = 
			"SELECT t.twr_score score FROM t_write t JOIN `member` m WHERE m.mb_uid = ? AND t.mb_uid = ? AND t.t_uid = ? ORDER BY t.twr_regdate DESC";
	
	
}
