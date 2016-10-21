package com.karaok.event.actions;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;

public class r_EventAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//��ü �̺�Ʈ ����
		EventDAO dao=new EventDAO();
		List<Event> listAll = null;
		listAll=dao.selectEvent();
		request.setAttribute("listAll", listAll);
		
		//�������� �̺�Ʈ ����
		
		List<Event> listIng =null;
		listIng=dao.selectIng();
		request.setAttribute("listIng", listIng);
		Date sysdate2=new Date();
		String sysdate = sysdate2.toString();
		request.setAttribute("sysdate", sysdate);


		
		
		//����� �̺�Ʈ ����
		List<Event> listEnd =null;
		listEnd=dao.selectEnd();
		request.setAttribute("listEnd", listEnd);

		
		return mapping.findForward("list");
	}
}
