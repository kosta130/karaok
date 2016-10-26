package com.karaok.screen.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.freeBoard.dto.FreeBoard;
import com.karaok.screen.dao.ScreenDAO;
import com.karaok.screen.dto.Screen;

public class ListAction extends Action{
	
		@Override
		public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ScreenDAO dao = new ScreenDAO();
				List<Screen> list = dao.listScreenBoard();
				request.setAttribute("list", list);
			
			return mapping.findForward("sc_success");
		}
}
