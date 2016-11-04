package com.karaok.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.RequestProcessor;

import com.karaok.game.server.Server;

public class MyRequestProcessor extends RequestProcessor{
	@Override
	protected boolean processPreprocess(HttpServletRequest request, HttpServletResponse response) {

		
		return super.processPreprocess(request, response);
	}
}
