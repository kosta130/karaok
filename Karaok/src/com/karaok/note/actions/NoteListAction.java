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
		
		request.getSession().setAttribute("list", list);
		String pageStr = request.getParameter("page");
		
		int page=1;
		int viewRowCnt=10;
		
		if(pageStr != null) {
			page = Integer.parseInt(pageStr);
		}
		
		int end = page*viewRowCnt;
		int start=end-(viewRowCnt-1);
		int totalRecord=dao.selectCount();
		int totalPage = totalRecord/viewRowCnt;
		
		if(totalRecord%viewRowCnt > 0) {
			totalPage++;
		}
		request.getSession().removeAttribute("list"); 
		request.getSession().removeAttribute("page"); 
		request.getSession().removeAttribute("totalPage"); 
		
		list = dao.selectPage(start,end);//dao.selectAll(); 			   
		
		request.getSession().setAttribute("list", list);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("totalPage", totalPage);
		
		return mapping.findForward("success");
	}

}
