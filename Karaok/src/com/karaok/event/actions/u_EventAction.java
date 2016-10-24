package com.karaok.event.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;

public class u_EventAction extends Action {

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		EventDAO dao=new EventDAO();
		Event dto = dao.seletConfirm(num);

		request.setAttribute("dto", dto);
		
		return mapping.findForward("confirm");
	}
}