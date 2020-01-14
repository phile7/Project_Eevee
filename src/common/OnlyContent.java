package common;

public interface OnlyContent {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	
	public static final String SQL_SELECT_ONLY_CONTENT_FROM_TWRITE = "SELECT twr_content FROM t_write WHERE t_uid = ? ORDER BY twr_regdate DESC";
	
	
}
