package com.karaok.qna.reply.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.qna.reply.dao.ReplyDAO;
import com.karaok.qna.reply.dto.Reply;

public class UpdateAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Reply reply = new Reply(
				Integer.parseInt(request.getParameter("no")),
				0,
				request.getParameter("nickname"),
				request.getParameter("contents"));
		
		ReplyDAO dao = new ReplyDAO();
		if(dao.update(reply)){
			request.setAttribute("msg", "댓글수정성공");
		}else{
			request.setAttribute("msg", "댓글수정실패");
		}
		return mapping.findForward("success");
	}
}
