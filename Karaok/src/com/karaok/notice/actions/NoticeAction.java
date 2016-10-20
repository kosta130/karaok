package com.karaok.notice.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.notice.dao.NoticeDAO;
import com.karaok.notice.dto.NoticeDTO;

public class NoticeAction extends Action {
	String action = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		NoticeDAO dao = new NoticeDAO();

		action = request.getParameter("action");

		ActionForward forward = mapping.findForward("list");
		if (action == null) {
			response.sendRedirect("/Karaok/notice.ok?action=list");
		} else if (action.equals("list")) {
			List<NoticeDTO> list = dao.selectAll();
			request.setAttribute("list", list);
			forward = mapping.findForward("list");

		} else if (action.equals("insert")) {

			NoticeDTO dto = new NoticeDTO(0, request.getParameter("nickname"), request.getParameter("subject"),
					request.getParameter("contents"), null);
			request.setAttribute("form", form);
			forward = mapping.findForward("form");
			dao.insert(dto);

		} else if (action.equals("upform")) {// 글수정 요청 action="update"

			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO dto = dao.select(num);
			dto.setnum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("upform");

		} else if (action.equals("update")) {// 글삭제 요청 action="delete"
			NoticeDTO dto = new NoticeDTO(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"), request.getParameter("subject"), request.getParameter("contents"),
					null);

			dao.update(dto);
		} else if (action.equals("delete")) {
			int num = Integer.parseInt(request.getParameter("num"));
			dao.delete(num);
		}
		return forward;
	}
}