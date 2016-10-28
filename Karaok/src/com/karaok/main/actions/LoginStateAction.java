package com.karaok.main.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dto.MemberDTO;

public class LoginStateAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("fail");
		
		String currentId = (String) request.getSession().getAttribute("currentId");
		String currentNickName = (String) request.getSession().getAttribute("currentNickName");
		MemberDTO currentInfo = (MemberDTO) request.getSession().getAttribute("currentInfo");
		
		int state = -1;
		String msg = null;
		if(currentId == null || currentNickName == null || currentInfo == null){
			state = 0;
			msg = "로그인아님";
		}else{
			state = 2;//현재 로그인중
			msg = "로그인중";
			request.setAttribute("state", state);
			request.getSession().setAttribute("currentInfo", currentInfo);
			request.getSession().setAttribute("currentId", currentId);
			request.getSession().setAttribute("currentNickName", currentNickName);
		}
		
		return forward;
	}
}
