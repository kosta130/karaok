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
		
		if (dao.selectCount(login_id) == 1) {//���̵� ����
			MemberDTO dto = new MemberDTO();
			dto.setId(login_id);
			dto.setPwd(login_pwd);
			dto = dao.selectLogin(dto);
			
			if(dto==null){//��й�ȣ ����ġ
				state = 0;
				msg = "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
				request.getSession().setAttribute("state", state);
				request.setAttribute("msg", msg);
				forward = mapping.findForward("success");
			}else{//��й�ȣ ��ġ
				state = 1;
				msg = "�α��� �Ǿ����ϴ�.";
				request.getSession().setAttribute("state", state);
				request.setAttribute("msg", msg);
				request.getSession().setAttribute("currentInfo", dto);
				request.getSession().setAttribute("currentId", login_id);
				request.getSession().setAttribute("currentNickName", dto.getNickname());
				forward = mapping.findForward("success");
			}
		} else {
			// ���̵� �������� ����
			state = 0;
			msg = "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
			request.setAttribute("state", state);
			request.setAttribute("msg", msg);
			forward = mapping.findForward("success");
		}

		System.out.println(login_id);
		System.out.println(login_pwd);

		return forward;
	}
}
