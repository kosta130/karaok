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
		
		if(action.equals("insert")){// 글입력 요청 action="insert"
			FreeBoard dto = new FreeBoard(0,
									request.getParameter("nickname"),
									request.getParameter("subject"),
									request.getParameter("contents"),null,
									0);
			dao.insertFreeBoard(dto);					
									
		}else if(action.equals("upform")){// 글수정폼 요청 action="upform"
			int num = Integer.parseInt(request.getParameter("num"));
			FreeBoard dto = dao.selectFreeBoard(num);
			dto.setNum(num);
			dao.seekCount(dto);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("upform");
			
		}else if(action.equals("update")){// 글수정 요청 action="update"
			FreeBoard dto = new FreeBoard(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"),
					request.getParameter("subject"),
					request.getParameter("contents"),null,
					0);
			
			dao.updateFreeBoard(dto);
			
		}else if(action.equals("view")){// 글화면 요청 
			int num = Integer.parseInt(request.getParameter("num"));
			FreeBoard dto = dao.selectFreeBoard(num);
			dto.setNum(num);
			dao.seekCount(dto);
			request.setAttribute("dto", dto);
			List<ReplyDTO> list1 = dao.ListReply(num); //댓글 받아오기
			request.setAttribute("list1", list1);
			
			forward = mapping.findForward("view");
			
		}else if(action.equals("select")){//글화면 관련
			FreeBoard dto = new FreeBoard(Integer.parseInt(request.getParameter("num")),
					request.getParameter("nickname"),
					request.getParameter("subject"),
					request.getParameter("contents"),null,
					Integer.parseInt(request.getParameter("hits")));
			
			dao.updateFreeBoard(dto);
			
		}else if(action.equals("delete")){// 글삭제 요청 action="delete"
			int num = Integer.parseInt(request.getParameter("num"));
			dao.deleteFreeBoard(num);
		}
		return forward;
		
	}
}
