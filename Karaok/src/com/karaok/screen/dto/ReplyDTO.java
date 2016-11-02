package com.karaok.screen.dto;

import java.sql.Date;

public class ReplyDTO {

		
		int replyNum;
		int num;
		String nickname;
		Date ndate;
		String contents;
		
		public ReplyDTO() {
			// TODO Auto-generated constructor stub
		}
		
		public ReplyDTO(int replyNum, int num, String nickname, Date ndate, String contents) {
			super();
			this.replyNum = replyNum;
			this.num = num;
			this.nickname = nickname;
			this.ndate = ndate;
			this.contents = contents;
		}
		public int getReplyNum() {
			return replyNum;
		}

		public void setReplyNum(int replyNum) {
			this.replyNum = replyNum;
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

		public Date getNdate() {
			return ndate;
		}

		public void setNdate(Date ndate) {
			this.ndate = ndate;
		}

		public String getContents() {
			return contents;
		}

		public void setContents(String contents) {
			this.contents = contents;
		}
	}

