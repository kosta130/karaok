package com.karaok.main.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dao.MemberDAO;
import com.karaok.main.dto.MemberDTO;

public class SignUpAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("fail");
		
		String id = request.getParameter("signup_id");
		String pwd = request.getParameter("signup_pass");
		String name = request.getParameter("signup_name");
		String nickname = request.getParameter("signup_nickname");
		String birth = request.getParameter("signup_birth");
		String tel = request.getParameter("signup_tel");
		
		int state = -1;
		String msg = "ȸ�����Խ���";
		
		if(id==null || pwd ==null || name==null || nickname==null || birth==null || tel==null){//�Է°� ����
			state=0;
			msg="ȸ�����Խ���";
			request.setAttribute("state", state);
			request.setAttribute("msg", msg);
			forward = mapping.findForward("success");
		}else if(id=="" || pwd =="" || name=="" || nickname=="" || birth=="" || tel==""){//�Է°� ����
			state=0;
			msg="ȸ�����Խ���";
			request.setAttribute("state", state);
			request.setAttribute("msg", msg);
			forward = mapping.findForward("success");
		}else{//�Է°� �Ϻ�
			MemberDTO dto = new MemberDTO(id, pwd, name, nickname, birth, tel);
			if(new MemberDAO().insertUser(dto).equals("success")){
				state=1;
				msg="ȸ�����Լ���";
				request.setAttribute("state", state);
				request.setAttribute("msg", msg);
				forward = mapping.findForward("success");
				System.out.println("���伺��");
			}else{//if(new MemberDAO().insertUser(dto).equals("fail")){
				state=0;
				msg="ȸ�����Խ���";
				request.setAttribute("state", state);
				request.setAttribute("msg", msg);
				forward = mapping.findForward("success");
				System.out.println("�������");
			}
		}
		
		return forward;
	}
}
