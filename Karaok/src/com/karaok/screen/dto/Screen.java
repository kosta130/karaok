package com.karaok.screen.dto;

import java.sql.Date;

public class Screen {

	int num;
	String id;
	String subject;
	String contents;
	Date ndate;
	int seek;
	String fileName;
	
	public Screen() {
		
	}
	
	public Screen(int num, String id, String subject, String contents, Date ndate, int seek, String fileName) {
		super();
		this.num = num;
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
