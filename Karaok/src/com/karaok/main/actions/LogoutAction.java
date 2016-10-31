package com.karaok.main.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dto.MemberDTO;

public class LogoutAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = mapping.findForward("fail");
		
		String currentId = (String)request.getSession().getAttribute("currentId");
		MemberDTO currentInfo = (MemberDTO)request.getSession().getAttribute("currentInfo");
		String currentNickName = (String)request.getSession().getAttribute("currentNickName");
		
		int state = -1;
		String msg = null;
		
		if(currentId != null || currentInfo != null || currentNickName != null){
			state = 3;
			msg = "로그아웃 되었습니다.";
			request.setAttribute("state", state);
			request.setAttribute("msg", msg);
			request.getSession().removeAttribute("currentId");
			request.getSession().removeAttribute("currentInfo");
			request.getSession().removeAttribute("currentNickName");
			forward = mapping.findForward("success");
		}
		
		return forward;
	}
}
