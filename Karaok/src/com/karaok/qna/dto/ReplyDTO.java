package com.karaok.qna.dto;

public class ReplyDTO {
	private int reply_num;
	private int num;
	private String nickname;
	private String contents;
	
	public ReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyDTO(int reply_num, int num, String nickname, String contents) {
		super();
		this.reply_num = reply_num;
		this.num = num;
		this.nickname = nickname;
		this.contents = contents;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	

}
