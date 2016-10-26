package com.karaok.qna.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.qna.dao.QnaDAO;
import com.karaok.qna.dto.QnaDTO;

public class QnaAction extends Action {
	private String action = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		QnaDAO dao = new QnaDAO();

		action = request.getParameter("action");
        System.out.println("Qna action: "+ action);
		ActionForward forward = mapping.findForward("qlist");
		List<QnaDTO> list = dao.selectAll();
		if(action==null || action.equals("qlist")){ 
				 
			list = dao.selectAll(); 
			request.getSession().setAttribute("qlist", list); 
			forward = mapping.findForward("qlist"); 
			//페이지 정보 얻어오기 
			String pageStr = request.getParameter("page"); 
					           
			int page=1;//기본페이지를 1페이지로 하겠다!! 
				    	   
			int viewRowCnt=10;//한 페이지에 보여줄 행(레코드)의 수 
			if(pageStr != null){ 
				  page = Integer.parseInt(pageStr); 
			} 
			
			int end=page*viewRowCnt; 
			int start=end-(viewRowCnt-1); 
			int totalRecord=dao.selectCount(); 
			System.out.println("totalRecord: "+ totalRecord); 
			int totalPage = totalRecord/viewRowCnt; 
			if(totalRecord%viewRowCnt >0) 
			totalPage++; 
			request.getSession().removeAttribute("qlist"); 
			request.getSession().removeAttribute("page"); 
			request.getSession().removeAttribute("totalPage"); 
			list = dao.selectPage(start,end);//dao.selectAll(); 			   
			request.getSession().setAttribute("qlist", list);//4. 영역에 데이터 저장 
			request.getSession().setAttribute("page", page);//현재페이지 
			request.getSession().setAttribute("totalPage", totalPage);//전체페이지 
			 //영역에 데이터 저장하는 이유? 뷰와 공유하기 위해서!!    	   
			return forward=mapping.findForward("qlist"); 
		    
		} else if (action.equals("insert")) {

			String nickname = request.getParameter("nickname");
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");

			QnaDTO dto = new QnaDTO();
			dto.setNickname(nickname);
			dto.setSubject(subject);
			dto.setContents(contents);

			if (dao.insert(dto)) {
				System.out.println("디비입력성공");
			} else {
				System.out.println("디비입력실패");
			}

			request.getSession().setAttribute("qlist", list);
			forward = mapping.findForward("insert");

		} else if (action.equals("edit")) {
			int num = Integer.parseInt(request.getParameter("num"));
			QnaDTO dto = dao.select(num);
			dto.setNum(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("edit");

		} else if (action.equals("update")) {
			int num = Integer.parseInt(request.getParameter("num"));
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");

			// 다섯개의 데이터를 하나(클래스)의 이름으로 묶기s
			QnaDTO dto = new QnaDTO();

			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setNum(num);

			if (dao.update(dto)) {
				request.getSession().setAttribute("qlist", dao.selectAll());
				forward = mapping.findForward("update");
			}
		} else if (action.equals("delete")) {
			int num = Integer.parseInt(request.getParameter("num"));
			dao.delete(num);
			request.getSession().setAttribute("qlist", dao.selectAll());
			forward = mapping.findForward("delete");
			
			
		} else if (action.equals("select")) {
			int num = Integer.parseInt(request.getParameter("num"));
			QnaDTO dto = dao.select(num);
			request.setAttribute("dto", dto);
			forward = mapping.findForward("select");
		}
		return forward;
	}
}