package common;

public interface R {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	public static final String SQL_UID_SELECT = "select t_uid from t_score group by t_uid";

	public static final String SQL_SCORE_SELECT = "select * from toilet_info, t_score where (t_score.t_uid = toilet_info.t_uid) and (t_score.ts_uid = (select max(ts_uid) from t_score where t_uid = ?))";

}
