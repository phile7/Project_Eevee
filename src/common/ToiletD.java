package common;

public interface ToiletD {
	
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	
	// toilet_info 관련 쿼리
	// select all
	public static final String SQL_TOILET_INFO_SELECT =
			"SELECT * FROM toilet_info ORDER BY t_uid DESC";
	
	// select by uid
	public static final String SQL_TOILET_INFO_SELECT_BY_UID =
			"SELECT * FROM toilet_info WHERE t_uid = ?";
	
	// select uid by latitude and longitude
	public static final String SQL_GET_UID_BY_LATITUDE_LONGITUDE =
			"CALL get_uid_by_location(?, ?)";
	
	
	

}
