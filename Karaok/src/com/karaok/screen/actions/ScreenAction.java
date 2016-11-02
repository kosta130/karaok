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
import com.karaok.screen.dto.Screen;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ScreenAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String id=(String)request.getSession().getAttribute("currentId");
		String nickname=(String)request.getSession().getAttribute("currentNickName");
		System.out.println(nickname);

		ScreenDAO dao = new ScreenDAO();
		String action = request.getParameter("action");
		ActionForward forward = mapping.findForward("sc_list");
		
		int maxSize=5*1024*1024;	
		String saveDirectory=request.getRealPath("img_soyoung");//������
		
		if (action.equals("insert")) {// ���Է� ��û
			
			MultipartRequest mr=
					new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",
							new DefaultFileRenamePolicy());			
			
			Screen dto = new Screen(0, 
					mr.getParameter("nickname"),
					mr.getParameter("subject"),
					mr.getParameter("contents"), 
					null, 
					0, 
					mr.getFilesystemName("fileName"));
			
			dao.insertScreen(dto);
		}else if(action.equals("view")){//��ȭ��,������ ������ ���
			int num = Integer.parseInt(request.getParameter("num"));
			Screen dto = dao.selectScreen(num);
			dto.setNum(num);
			dao.seekCount(dto);
			request.setAttribute("dto", dto);
			List<ReplyDTO> list1 = dao.ListReply(num); //��� �޾ƿ���
			request.setAttribute("list1", list1);
			forward = mapping.findForward("sc_view");
			
		}else if(action.equals("edit")){// �ۼ����� ��û 
			
		
			int num = Integer.parseInt(request.getParameter("num"));
			Screen dto = dao.selectScreen(num);
			dto.setNum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("sc_edit");
			
		}else if(action.equals("update")){// �ۼ��� ��û action="update"
			
			MultipartRequest mr=
					new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",
							new DefaultFileRenamePolicy());			
			
			Screen dto = new Screen(Integer.parseInt(mr.getParameter("num")),
					mr.getParameter("nickname"),
					mr.getParameter("subject"),
					mr.getParameter("contents"),
					null,
					0,
					mr.getFilesystemName("fileName"));
			
			dao.updateScreen(dto);
			
		}else if(action.equals("delete")){// �ۻ��� ��û action="delete"
			int num = Integer.parseInt(request.getParameter("num"));
			dao.deleteScreen(num);
		
		}	
		return forward;
	}
}
