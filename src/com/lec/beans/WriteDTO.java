package com.lec.beans;

public class WriteDTO {
	private int pwr_uid; // pwr_uid
	private int mb_uid; // mb_uid
	private String mb_id;
	private String subject; // pwr_subject
	private String content; // pwr_content
	private int viewCnt; // pwr_viewcnt
	private String regDate; // pwr_regdate
	
	
	// 기본생성자


	
	// 매개변수 받는 생성자
	public WriteDTO(int pwr_uid, int mb_uid, String mb_id, String subject, String content, int viewCnt, String regDate) {
		super();
		this.pwr_uid = pwr_uid;
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.subject = subject;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		System.out.println("WriteDTO(pwr_uid, mb_uid, subject, content, viewCnt) 객체 생성");
	}
	
	// getter/setter
	public int getPwr_uid() {
		return pwr_uid;
	}

	public void setPwr_uid(int pwr_uid) {
		this.pwr_uid = pwr_uid;
	}

	public int getMb_uid() {
		return mb_uid;
	}

	public void setMb_uid(int mb_uid) {
		this.mb_uid = mb_uid;
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

	
	//디버깅용
	@Override
	public String toString() {
		return "WriteDTO]" + ":" + subject + ":" + content + ":"
				+ ":" + viewCnt + ":" + regDate;
	}
}
