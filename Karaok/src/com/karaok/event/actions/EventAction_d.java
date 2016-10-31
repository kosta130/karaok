package com.karaok.event.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;

public class EventAction_d extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.getSession().getAttribute("currentId");
		request.getSession().getAttribute("currentNickName");
		
		int num=Integer.parseInt(request.getParameter("num"));
		EventDAO dao=new EventDAO();
		dao.deleteEvent(num);
		return mapping.findForward("delete");
	}
}
