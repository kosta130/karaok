package com.karaok.event.dto;


public class Event {
	private int num;
	private String id;
	private String subject;
	private String contents;
	private String startDate;
	private String endDate;
	private String fileName;
	private String point;
	private String state;
	
	
	public Event() {
		// TODO Auto-generated constructor stub
	}
	
	


	public String getState() {
		return state;
	}




	public void setState(String state) {
		this.state = state;
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


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getPoint() {
		return point;
	}


	public void setPoint(String point) {
		this.point = point;
	}


	

}
