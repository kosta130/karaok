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
			NoteDTO dto = new NoteDTO(0, request.getParameter("nickname"), request.getParameter("subject"),  request.getParameter("contents"), null, 0);
			dao.insert(dto);
		} else if(action.equals("upform")) {
			int num= Integer.parseInt(request.getParameter("num"));
			NoteDTO dto = dao.select(num);
			dto.setNum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("upform");
		} else if(action.equals("update")){
			NoteDTO dto = new NoteDTO(Integer.parseInt(request.getParameter("num")), request.getParameter("nickname"), request.getParameter("subject"),  request.getParameter("contents"), null, Integer.parseInt(request.getParameter("hits")));
			dao.update(dto);
		} else if(action.equals("view")){
			int num = Integer.parseInt(request.getParameter("num"));
			NoteDTO dto =dao.select(num);
			dto.setNum(num);
			dao.hitsup(dto);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("view");
		} else if(action.equals("select")){
			NoteDTO dto = new NoteDTO(Integer.parseInt(request.getParameter("num")),
			request.getParameter("nickname"),
			request.getParameter("subject"),
			request.getParameter("contents"),
			null,
			Integer.parseInt(request.getParameter("hits")));
			
			dao.update(dto);
		}else if(action.equals("delete")){
			int num = Integer.parseInt(request.getParameter("num"));
			dao.delete(num);
		}
			
		
		return forward;
	}

}
