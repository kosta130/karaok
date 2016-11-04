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
		System.out.println("로그인 상태 진입");
		if(currentId == null || currentNickName == null || currentInfo == null){
			state = 0;
			msg = "로그인이 필요합니다";
			request.setAttribute("msg", msg);
			request.setAttribute("state", state);
			System.out.println("로그인 되지 않은 상태");
			
			forward = mapping.findForward("success");
		}else{
			state = 2;//현재 로그인중
			msg = "게임 대기실에 접속합니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("state", state);
			System.out.println("로그인 된 상태");
			request.getSession().setAttribute("currentInfo", currentInfo);
			request.getSession().setAttribute("currentId", currentId);
			request.getSession().setAttribute("currentNickName", currentNickName);
			
			forward = mapping.findForward("success");
		}
		
		return forward;
	}
}
