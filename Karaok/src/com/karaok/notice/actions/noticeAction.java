package com.karaok.notice.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.notice.dao.noticeDAO;
import com.karaok.notice.dto.noticeDTO;

public class noticeAction extends Action {
	String action = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		noticeDAO dao = new noticeDAO();

		action = request.getParameter("action");

		ActionForward forward = mapping.findForward("list");
		if (action == null) {
			response.sendRedirect("/Karaok/notice/control.ok?action=list");
		} else if (action.equals("list")) {// 글입력 요청 action="insert"
			List<noticeDTO> list = dao.selectAll();
			System.out.println("actionList=" + list);
			request.setAttribute("list", list);
			forward = mapping.findForward("list");

		} else if (action.equals("insert")) {// 글수정폼 요청 action="upform"

			noticeDTO dto = new noticeDTO(0, request.getParameter("nickname"), request.getParameter("subject"),
					request.getParameter("contents"), null);
			dao.insert(dto);

		} else if (action.equals("upform")) {// 글수정 요청 action="update"

			int num = Integer.parseInt(request.getParameter("num"));
			noticeDTO dto = dao.select(num);
			dto.setnum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("upform");

		} else if (action.equals("update")) {// 글삭제 요청 action="delete"
			noticeDTO dto = new noticeDTO(Integer.parseInt(request.getParameter("num")),
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