package com.karaok.screen.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.screen.dao.ScreenDAO;
import com.karaok.screen.dto.Screen;

public class ScreenAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ScreenDAO dao = new ScreenDAO();
		String action = request.getParameter("action");
		ActionForward forward = mapping.findForward("sc_list");

		if (action.equals("insert")) {// 글입력 요청
			Screen dto = new Screen(0, request.getParameter("nickname"), request.getParameter("subject"),
					request.getParameter("contents"), null, 0, request.getParameter("fileName"));

			dao.insertScreen(dto);
		}
		return forward;

	}
}
