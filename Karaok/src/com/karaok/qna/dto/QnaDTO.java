package com.karaok.qna.dto;

import java.sql.Date;

public class QnaDTO {
	private int num;
	private String nickname;
	private String subject;
	private String contents;
	private Date ndate;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaDTO(int num, String nickname, String subject, String contents, Date ndate) {
		super();
		this.num = num;
		this.nickname = nickname;
		this.subject = subject;
		this.contents = contents;
		this.ndate = ndate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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
