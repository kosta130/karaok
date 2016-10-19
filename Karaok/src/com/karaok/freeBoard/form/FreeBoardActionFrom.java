package com.karaok.freeBoard.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class FreeBoardActionFrom extends ActionForm{
	
	private int num;
	private String nickname;
	private String subject;
	private String pass;
	private String contents;
	
	public int getNo() {
		return num;
	}

	public void setNo(int no) {
		this.num = num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String id) {
		this.nickname = nickname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		
		ActionErrors err = new ActionErrors();
		
		if( nickname.isEmpty() || subject.isEmpty() || pass.isEmpty() || contents.isEmpty() ){
			err.add("errMsg",new ActionMessage("listMsg","빈 값 없이 입력하세요."));
		}
		
		return err;
	}//validate
}
