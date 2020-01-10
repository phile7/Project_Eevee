package com.lec.beans;

public class CommentDTO {
	private int co_uid;
	private int co_puid;
	private int mb_uid;
	private String mb_id;
	private int co_depth;
	private String comment; //co_content
	private String regDate;
	
	public CommentDTO(int co_uid, int co_puid, int mb_uid, String mb_id, int co_depth, String comment, String regDate) {
		super();
		this.co_uid = co_uid;
		this.co_puid = co_puid;
		this.mb_uid = mb_uid;
		this.mb_id = mb_id;
		this.co_depth = co_depth;
		this.comment = comment;
		this.regDate = regDate;
		System.out.println("CommentDTO(co_uid, co_puid, mb_uid, mb_id, comment, regDate) 객체 생성");
	}
	
	public int getCo_uid() {
		return co_uid;
	}

	public void setCo_uid(int co_uid) {
		this.co_uid = co_uid;
	}
	
	public int getCo_puid() {
		return co_puid;
	}

	public void setCo_puid(int co_puid) {
		this.co_puid = co_puid;
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
	
	public int getCo_depth() {
		return co_depth;
	}

	public void setCo_depth(int co_depth) {
		this.co_depth = co_depth;
	}
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
