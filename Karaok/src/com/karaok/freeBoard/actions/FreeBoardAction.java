package com.karaok.freeBoard.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.freeBoard.dao.FreeBoardDAO;
import com.karaok.freeBoard.dto.FreeBoard;
import com.karaok.freeBoard.dto.ReplyDTO;

public class FreeBoardAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		FreeBoardDAO dao = new  FreeBoardDAO();
		
		String action =request.getParameter("action");
		
		ActionForward forward = mapping.findForward("list");
		
		if(action.equals("insert")){// ���Է� ��û action="insert"
			FreeBoard dto = new FreeBoard(0,
									request.getParameter("nickname"),
									request.getParameter("subject"),
									request.getParameter("contents"),null,
									0);
			dao.insertFreeBoard(dto);					
									
		}else if(action.equals("upform")){// �ۼ����� ��û action="upform"
			int num = Integer.parseInt(request.getParameter("num"));
			FreeBoard dto = dao.selectFreeBoard(num);
			dto.setNum(num);
			dao.seekCount(dto);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("upform");
			
		}else if(action.equals("update")){// �ۼ��� ��û action="update"
			FreeBoard dto = new FreeBoard(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"),
					request.getParameter("subject"),
					request.getParameter("contents"),null,
					0);
			
			dao.updateFreeBoard(dto);
			
		}else if(action.equals("view")){// ��ȭ�� ��û 
			int num = Integer.parseInt(request.getParameter("num"));
			FreeBoard dto = dao.selectFreeBoard(num);
			dto.setNum(num);
			dao.seekCount(dto);
			request.setAttribute("dto", dto);
			List<ReplyDTO> list1 = dao.ListReply(num); //��� �޾ƿ���
			request.setAttribute("list1", list1);
			
			forward = mapping.findForward("view");
			
		}else if(action.equals("select")){//��ȭ�� ����
			FreeBoard dto = new FreeBoard(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"),
					request.getParameter("subject"),
					request.getParameter("contents"),null,
					Integer.parseInt(request.getParameter("hits")));
			
			dao.updateFreeBoard(dto);
			
		}else if(action.equals("delete")){// �ۻ��� ��û action="delete"
			int num = Integer.parseInt(request.getParameter("num"));
			dao.deleteFreeBoard(num);
		}
		return forward;
		
	}
}
