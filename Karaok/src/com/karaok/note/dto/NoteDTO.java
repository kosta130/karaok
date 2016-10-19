package com.karaok.note.dto;

import java.sql.Date;

public class NoteDTO {
	
	private int num;
	private String id;
	private String subject;
	private String contents;
	private Date date;
	
	public NoteDTO() {
	}

	public NoteDTO(int num, String id, String subject, String contents, Date date) {
		super();
		this.num = num;
		this.id = id;
		this.subject = subject;
		this.contents = contents;
		this.date = date;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
