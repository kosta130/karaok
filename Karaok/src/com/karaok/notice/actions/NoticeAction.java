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
			
			String nickname=request.getParameter("nickname");
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			
			NoticeDTO dto = new NoticeDTO();
			dto.setNickname(nickname);
			dto.setSubject(subject);
			dto.setContents(contents);
			
			if(dao.insert(dto)==true){
				System.out.println("디비입력성공");
			}else{
				System.out.println("디비입력실패");
			}
			
	
			forward = mapping.findForward("form");

		} else if (action.equals("edit")) {

			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO dto = dao.select(num);
			dto.setnum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("edit");

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