package com.karaok.screen.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.screen.dao.ScreenDAO;
import com.karaok.screen.dto.ReplyDTO;



public class ReplyAction extends Action{
		int num;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String nickname = (String)request.getSession().getAttribute("currentNickName");
		
		String action = request.getParameter("action");
		ScreenDAO dao=new ScreenDAO();
		System.out.println(nickname);
		if(action.equals("insertReply")){
			num=Integer.parseInt(request.getParameter("num"));
			String contents = request.getParameter("contents");
			ReplyDTO dto = new ReplyDTO();
			dto.setNickname(nickname);
			dto.setContents(contents);
			dto.setNum(num);
			
			dao.insertReply(dto);
			
			List<ReplyDTO> list = dao.ListReply(num);
			request.setAttribute("list", list);
			
			return mapping.findForward("reply");
		}
		return mapping.findForward("sc_view");
	}
}