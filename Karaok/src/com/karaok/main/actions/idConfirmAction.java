package com.karaok.main.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.main.dao.MemberDAO;

public class idConfirmAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("signup_id");
		int countResult;
		if(id!=null && !id.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$")){
			countResult=2;//이메일 형식 미비
			request.setAttribute("countResult", countResult);
			return mapping.findForward("success");
		}
		
		//DB전달 ---> ID갯수 조회
		MemberDAO memberDao = new MemberDAO();
		countResult = memberDao.selectCount(id);
		if(countResult>-1){
			request.setAttribute("countResult", countResult);
			return mapping.findForward("success");
		}else
			return mapping.findForward("fail");
	}
}
