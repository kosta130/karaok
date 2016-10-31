package com.karaok.screen.dto;

import java.sql.Date;

public class Screen {

	private int num;
	private String nickname;
	private String subject;
	private String contents;
	private Date ndate;
	private int seek;
	private String fileName;
	private String re_id;
	private int re_num;
	private String re_contents;
	public Screen() {
		
	}
	
	




	public String getRe_contents() {
		return re_contents;
	}






	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}






	public String getRe_id() {
		return re_id;
	}






	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}











	public Screen(int num, String nickname, String subject, String contents, Date ndate, int seek, String fileName,
			String re_id, int re_num, String re_contents) {
		super();
		this.num = num;
		this.nickname = nickname;
		this.subject = subject;
		this.contents = contents;
		this.ndate = ndate;
		this.seek = seek;
		this.fileName = fileName;
		this.re_id = re_id;
		this.re_num = re_num;
		this.re_contents = re_contents;
	}






	public int getRe_num() {
		return re_num;
	}



	public void setRe_num(int re_num) {
		this.re_num = re_num;
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
