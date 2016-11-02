package com.karaok.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.RequestProcessor;

import com.karaok.game.server.Server;

public class MyRequestProcessor extends RequestProcessor{
	@Override
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {

		//게임서버 실행
		new Server();
		System.out.println("게임서버 실행을 위한 RequestProcessor입니다...");
		return super.processPreprocess(request, response);
	}
}
