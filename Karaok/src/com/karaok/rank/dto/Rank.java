package com.karaok.rank.dto;

import java.sql.Date;

public class Rank {
	

	private int rank;
	private int score;
	private String nickname;
	private Date ndate;
	
	public Rank() {
	}

	public Rank(int rank, int score, String nickname, Date ndate) {
		super();
		this.rank = rank;
		this.score = score;
		this.nickname = nickname;
		this.ndate = ndate;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
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
	
}
