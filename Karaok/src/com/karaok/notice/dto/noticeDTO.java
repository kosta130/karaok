package com.karaok.notice.dto;

import java.sql.Date;

public class noticeDTO {
	private int no;
	private String nickname;
	private String subject;
	private String contents;
	private Date ndate;
	
	public noticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public noticeDTO(int no, String nickname, String subject, String contents, Date ndate) {
		super();
		this.no = no;
		this.nickname = nickname;
		this.subject = subject;
		this.contents = contents;
		this.ndate = ndate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	
	
}
