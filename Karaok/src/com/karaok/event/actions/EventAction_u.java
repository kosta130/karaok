package com.karaok.event.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;

public class EventAction_u extends Action {

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		//�۹�ȣ �޾ƿͼ� �ش�Ǵ� �Խù� ���
		EventDAO dao=new EventDAO();
		Event dto = dao.seletConfirm(num);
		request.setAttribute("num", num);
		request.setAttribute("dto", dto);
		
		//������, ������ ���
		Event pre = dao.previous(num);
		Event next= dao.next(num);
		request.setAttribute("pre", pre);
		request.setAttribute("next",next);

		
		
		return mapping.findForward("confirm");
	}
}
