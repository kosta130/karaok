package com.karaok.note.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.note.dao.NoteDAO;
import com.karaok.note.dto.NoteDTO;

public class NoteAction extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoteDAO dao = new NoteDAO();
		
		String action = request.getParameter("action");
		ActionForward forward = mapping.findForward("list");
		
		if(action.equals("insert")) {
			NoteDTO dto = new NoteDTO(0, request.getParameter("nickname"), request.getParameter("subject"),  request.getParameter("contents"), null);
			dao.insert(dto);
		}
		
		return forward;
	}

}
