package com.karaok.qna.reply.dto;

public class Reply {
	   private int no;
	   private int num;
	   private String name;
	   private String content;
	   
	   public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int no, int num, String name, String content) {
		super();
		this.no = no;
		this.num = num;
		this.name = name;
		this.content = content;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	   
	

}
