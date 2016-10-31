package com.karaok.event.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;
import com.karaok.event.dto.EventReply;

public class EventAction_u extends Action {
	
	int num;

	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String id=(String)request.getSession().getAttribute("currentId");
		request.getSession().getAttribute("currentNickName");
		
		String action=request.getParameter("action");
		
		
		EventDAO dao=new EventDAO();
		
		//�۹�ȣ �޾ƿͼ� �ش�Ǵ� �Խù� ���
		if(action.equals("read")){
		 num=Integer.parseInt(request.getParameter("num"));
		Event dto = dao.seletConfirm(num);
		List<EventReply> list = dao.ListReply(num);//���� �޾ƿ���
		request.setAttribute("list", list);
		request.setAttribute("num", num);
		request.setAttribute("dto", dto);
		
		//������, ������ ���
		Event pre = dao.previous(num);
		Event next= dao.next(num);
		request.setAttribute("pre", pre);
		request.setAttribute("next",next);
		
		//��� ��ϴ����� ���� ���?
		}else if(action.equals("insertReply")){
				String contents=request.getParameter("contents");
				System.out.println(contents);
				EventReply dto=new EventReply();
				dto.setId(id);
				dto.setContents(contents);
				dto.setNum(num);
				dao.insertReply(dto);//��� ���
				
				List<EventReply> list = dao.ListReply(num); //��� ����Ʈ
				request.setAttribute("list", list);
				
				return mapping.findForward("reply");
				
		}
		return mapping.findForward("confirm");
	}
}
