package com.karaok.note.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.note.dao.NoteDAO;
import com.karaok.note.dto.NoteDTO;

public class NoteListAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoteDAO dao = new NoteDAO();
		List<NoteDTO> list = dao.selectAll();
		
		request.setAttribute("list", list);
		
		return mapping.findForward("success");
	}

}
