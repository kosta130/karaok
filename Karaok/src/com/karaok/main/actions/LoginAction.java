package com.karaok.main.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dao.MemberDAO;
import com.karaok.main.dto.MemberDTO;

public class LoginAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String login_id = request.getParameter("login_id");
		String login_pwd = request.getParameter("login_pwd");

		ActionForward forward = mapping.findForward("fail");
		
		MemberDAO dao = new MemberDAO();
		int state = -1;
		String msg = null;
		
		if (dao.selectCount(login_id) == 1) {//아이디 존재
			MemberDTO dto = new MemberDTO();
			dto.setId(login_id);
			dto.setPwd(login_pwd);
			dto = dao.selectLogin(dto);
			
			if(dto==null){//비밀번호 불일치
				state = 0;
				msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
				request.getSession().setAttribute("state", state);
				request.setAttribute("msg", msg);
				forward = mapping.findForward("success");
			}else{//비밀번호 일치
				state = 1;
				msg = "로그인 되었습니다.";
				request.getSession().setAttribute("state", state);
				request.setAttribute("msg", msg);
				request.getSession().setAttribute("currentInfo", dto);
				request.getSession().setAttribute("currentId", login_id);
				request.getSession().setAttribute("currentNickName", dto.getNickname());
				forward = mapping.findForward("success");
			}
		} else {
			// 아이디 존재하지 않음
			state = 0;
			msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
			request.setAttribute("state", state);
			request.setAttribute("msg", msg);
			forward = mapping.findForward("success");
		}

		System.out.println(login_id);
		System.out.println(login_pwd);

		return forward;
	}
}
