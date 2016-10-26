package com.karaok.screen.dto;

import java.util.Date;

public class Screen {

	private int num;
	private String nickname;
	private String subject;
	private String contents;
	private Date ndate;
	private int seek;
	private String fileName;
	
	public Screen() {
		
	}
	public Screen(int num, String nickname, String subject, String contents, Date ndate, int seek, String fileName) {
	
		this.num = num;
		this.nickname = nickname;
		this.subject = subject;
		this.contents = contents;
		this.ndate = ndate;
		this.seek = seek;
		this.fileName = fileName;
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

	public int getSeek() {
		return seek;
	}
	public void setSeek(int seek) {
		this.seek = seek;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	
	

}
