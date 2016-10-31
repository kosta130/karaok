package com.karaok.freeBoard.dto;

import java.sql.Date;

public class FreeBoard {
	
	private int num;
	private String nickname;
	private String subject;
	private String contents;
	private Date ndate;
	private int hits;
	
	
	public FreeBoard() {
		
	}//»ý¼ºÀÚ
	
	public FreeBoard(int num, String nickname, String subject, String contents, Date ndate,int hits) {
		
		this.num = num;
		this.nickname = nickname;
		this.subject = subject;
		this.contents = contents;
		this.ndate = ndate;
		this.hits = hits;
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
	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}


}//FreeBoard
