package beans.toilet;

public class ToiletDTO {

	private int t_uid;
	private String t_name;
	private String t_location;
	private String t_location_o;
	private double t_latitude;
	private double t_longitude;
	private int t_gender;
	private int t_kid_M;
	private int t_kid_W;
	private int t_disabled_M;
	private int t_disabled_W;
	private int t_count_M;
	private int t_count_W;
	
	// 기본 생성자
	public ToiletDTO() {
		System.out.println("DTO() 객체 생성");
	}

	// 매개변수 받는 생성자
	public ToiletDTO(int t_uid, String t_name, String t_location, String t_location_o, double t_latitude, double t_longitude,
			int t_gender, int t_kid_M, int t_kid_W, int t_disabled_M, int t_disabled_W, int t_count_M, int t_count_W) {
		super();
		this.t_uid = t_uid;
		this.t_name = t_name;
		this.t_location = t_location;
		this.t_location_o = t_location_o;
		this.t_latitude = t_latitude;
		this.t_longitude = t_longitude;
		this.t_gender = t_gender;
		this.t_kid_M = t_kid_M;
		this.t_kid_W = t_kid_W;
		this.t_disabled_M = t_disabled_M;
		this.t_disabled_W = t_disabled_W;
		this.t_count_M = t_count_M;
		this.t_count_W = t_count_W;
	}
	
	// getter setter
	public int getT_uid() {
		return t_uid;
	}

	public void setT_uid(int t_uid) {
		this.t_uid = t_uid;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getT_location() {
		return t_location;
	}

	public void setT_location(String t_location) {
		this.t_location = t_location;
	}

	public String getT_location_o() {
		return t_location_o;
	}

	public void setT_location_o(String t_location_o) {
		this.t_location_o = t_location_o;
	}

	public double getT_latitude() {
		return t_latitude;
	}

	public void setT_latitude(double t_latitude) {
		this.t_latitude = t_latitude;
	}

	public double getT_longitude() {
		return t_longitude;
	}

	public void setT_longitude(double t_longitude) {
		this.t_longitude = t_longitude;
	}

	public int getT_gender() {
		return t_gender;
	}

	public void setT_gender(int t_gender) {
		this.t_gender = t_gender;
	}

	public int getT_kid_M() {
		return t_kid_M;
	}

	public void setT_kid_M(int t_kid_M) {
		this.t_kid_M = t_kid_M;
	}

	public int getT_kid_W() {
		return t_kid_W;
	}

	public void setT_kid_W(int t_kid_W) {
		this.t_kid_W = t_kid_W;
	}

	public int getT_disabled_M() {
		return t_disabled_M;
	}

	public void setT_disabled_M(int t_disabled_M) {
		this.t_disabled_M = t_disabled_M;
	}

	public int getT_disabled_W() {
		return t_disabled_W;
	}

	public void setT_disabled_W(int t_disabled_W) {
		this.t_disabled_W = t_disabled_W;
	}

	public int getT_count_M() {
		return t_count_M;
	}

	public void setT_count_M(int t_count_M) {
		this.t_count_M = t_count_M;
	}

	public int getT_count_W() {
		return t_count_W;
	}

	public void setT_count_W(int t_count_W) {
		this.t_count_W = t_count_W;
	}

	
	@Override
	public String toString() {
		return "toilet_info_DTO]" + t_uid + " : " + t_name + " : " + t_location 
				+ " : " + t_location_o + " : " + t_latitude + " : " + t_longitude 
				+ " : " + t_gender + " : " + t_kid_M + " : " + t_kid_W 
				+ " : " + t_disabled_M + " : " + t_disabled_W + " : " 
				+ t_count_M + " : " + t_count_W;
	}

	
	
	
}	
	
	