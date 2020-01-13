package com.lec.beans;

public class ToiletWriteDTO {
	private int twr_uid; 
	private int mb_uid; 
	private int t_uid; 
	private int ts_uid; 
	private double twr_score; 
	private double ts_score; 
	private String mb_id;
	private String subject; 
	private String content; 
	private int viewCnt; 
	private String regDate; 
	
	public ToiletWriteDTO(int twr_uid, int mb_uid, int t_uid, int ts_uid, double twr_score, double ts_score, String mb_id,
			String subject, String content, int viewCnt, String regDate) {
		super();
		this.twr_uid = twr_uid;
		this.mb_uid = mb_uid;
		this.t_uid = t_uid;
		this.ts_uid = ts_uid;
		this.twr_score = twr_score;
		this.ts_score = ts_score;
		this.mb_id = mb_id;
		this.subject = subject;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	public int getTwr_uid() {
		return twr_uid;
	}
	public void setTwr_uid(int twr_uid) {
		this.twr_uid = twr_uid;
	}
	public int getMb_uid() {
		return mb_uid;
	}
	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}
	public int getT_uid() {
		return t_uid;
	}
	public void setT_uid(int t_uid) {
		this.t_uid = t_uid;
	}
	public int getTs_uid() {
		return ts_uid;
	}
	public void setTs_uid(int ts_uid) {
		this.ts_uid = ts_uid;
	}
	public double getTwr_score() {
		return twr_score;
	}
	public void setTwr_score(double twr_score) {
		this.twr_score = twr_score;
	}
	public double getTs_score() {
		return ts_score;
	}
	public void setTs_score(double ts_score) {
		this.ts_score = ts_score;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
