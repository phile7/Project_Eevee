package com.lec.beans;

public class RankDTO {
	private int t_uid; 
	private String t_name;
	private String t_location_O;
	private String t_location; 
	private double ts_score;
	
	
	public RankDTO(int t_uid, String t_name, String t_location_O, String t_location, double ts_score) {
		super();
		this.t_uid = t_uid;
		this.t_name = t_name;
		this.t_location_O = t_location_O;
		this.t_location = t_location;
		this.ts_score = ts_score;
	}


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


	public String getT_location_O() {
		return t_location_O;
	}


	public void setT_location_O(String t_location_O) {
		this.t_location_O = t_location_O;
	}


	public String getT_location() {
		return t_location;
	}


	public void setT_location(String t_location) {
		this.t_location = t_location;
	}


	public double getTs_score() {
		return ts_score;
	}


	public void setTs_score(double ts_score) {
		this.ts_score = ts_score;
	}
	
	
}
