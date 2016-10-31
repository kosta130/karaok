package com.karaok.screen.dto;

import java.sql.Date;

public class ScreenReply {
	private int replyNum;
	private int re_num;
	private String re_id;
	private Date re_ndate;
	private String re_contents;
	
	public ScreenReply() {
		// TODO Auto-generated constructor stub
	}
	public ScreenReply(int replyNum, int re_num, String re_id, Date re_ndate, String re_contents) {
		super();
		this.replyNum = replyNum;
		this.re_num = re_num;
		this.re_id = re_id;
		this.re_ndate = re_ndate;
		this.re_contents = re_contents;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_id() {
		return re_id;
	}
	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}
	public Date getRe_ndate() {
		return re_ndate;
	}
	public void setRe_ndate(Date re_ndate) {
		this.re_ndate = re_ndate;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
}
