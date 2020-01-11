package user;

public class UserDTO {

	
	private String uid;
	private String pw;
	private String email;
	private String emailHash;
	private boolean sign;
	
	public UserDTO() {
		super();
	}

	public UserDTO(String uid, String pw, String email, String emailHash, boolean sign) {
		super();
		
		this.uid = uid;
		this.pw = pw;
		this.email = email;
		this.emailHash = emailHash;
		this.sign = sign;
	}


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailHash() {
		return emailHash;
	}

	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}

	public boolean isSign() {
		return sign;
	}

	public void setSign(boolean sign) {
		this.sign = sign;
	}
	
	
	
}
