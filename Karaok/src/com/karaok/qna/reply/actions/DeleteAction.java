package com.karaok.qna.reply.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.qna.reply.dao.ReplyDAO;

public class DeleteAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		ReplyDAO dao = new ReplyDAO();
		if(dao.delete(no)){
			request.setAttribute("msg", "댓글삭제성공");
		}else{
			request.setAttribute("msg", "댓글삭제실패");
		}
		
		return mapping.findForward("success");
	}
}
