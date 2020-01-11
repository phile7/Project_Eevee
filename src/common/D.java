package common;

public interface D {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO member"
			+ "(mb_id, mb_password, mb_email, mb_emailHash) VALUES"
			+ "(?, ?, ?, ?)";
	
	public static final String SQL_SELECT_BY_IDPW =
			"SELECT * FROM member WHERE mb_id = ?";
	
	public static final String SQL_SELECT_BY_IDEMAILCK =
			"SELECT mb_emailSign FROM member WHERE mb_id = ?";
	
	public static final String SQL_SELECT_BY_IDEMAIL =
			"SELECT mb_email FROM member WHERE mb_id = ?";
	
	public static final String SQL_UPDATE_BY_IDEMAILCK =
			"UPDATE member SET mb_emailSign = true WHERE mb_id = ?";
}











