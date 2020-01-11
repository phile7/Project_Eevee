package com.lec.beans;

public class CenterDTO {
	private int cwr_uid; // cwr_uid
	private int mb_uid; // mb_uid
	private int mb_level; // mb_uid
	private String mb_id;
	private String subject; // pwr_subject
	private String content; // pwr_content
	private int viewCnt; // pwr_viewcnt
	private String regDate; // pwr_regdate
	
	public CenterDTO(int cwr_uid, int mb_uid, int mb_level, String mb_id, String subject, String content, int viewCnt,
			String regDate) {
		super();
		this.cwr_uid = cwr_uid;
		this.mb_uid = mb_uid;
		this.mb_level = mb_level;
		this.mb_id = mb_id;
		this.subject = subject;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
	}
	
	public int getCwr_uid() {
		return cwr_uid;
	}

	public void setCwr_uid(int cwr_uid) {
		this.cwr_uid = cwr_uid;
	}

	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
	}

	public int getMb_level() {
		return mb_level;
	}

	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
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
