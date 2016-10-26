package com.karaok.screen.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.freeBoard.dto.FreeBoard;
import com.karaok.screen.dao.ScreenDAO;
import com.karaok.screen.dto.Screen;

public class ScreenAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ScreenDAO dao = new ScreenDAO();
		String action = request.getParameter("action");
		ActionForward forward = mapping.findForward("sc_list");

		if (action.equals("insert")) {// ���Է� ��û
			Screen dto = new Screen(0, 
					request.getParameter("nickname"), 
					request.getParameter("subject"),
					request.getParameter("contents"), 
					null, 
					0, 
					request.getParameter("fileName"));

			dao.insertScreen(dto);
		}else if(action.equals("view")){//��ȭ��,������ ������ ���
			int num = Integer.parseInt(request.getParameter("num"));
			Screen dto = dao.selectScreen(num);
			dto.setNum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("sc_view");
			
		}else if(action.equals("edit")){// �ۼ����� ��û 
			int num = Integer.parseInt(request.getParameter("num"));
			Screen dto = dao.selectScreen(num);
			dto.setNum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("sc_edit");
			
		}else if(action.equals("update")){// �ۼ��� ��û action="update"
			Screen dto = new Screen(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"),
					request.getParameter("subject"),
					request.getParameter("contents"),
					null,
					0,
					request.getParameter("fileName"));
			
			dao.updateScreen(dto);
			
		}else if(action.equals("delete")){// �ۻ��� ��û action="delete"
			int num = Integer.parseInt(request.getParameter("num"));
			dao.deleteScreen(num);
		}
		
			return forward;

	}
}
