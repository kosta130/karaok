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



public class ListAction extends Action{
	private String action = null;
		@Override
		public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {//전체 게시물 조회
			
			String id=(String)request.getSession().getAttribute("currentId");
			String currentNickName = (String)request.getSession().getAttribute("currentNickName");
			request.setAttribute("currentNickName", currentNickName);
			
			FreeBoardDAO dao=new FreeBoardDAO();
			action = request.getParameter("action");
			
			
			if(action==null || action.equals("list")){ 
				 
				
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
				int totalPage = totalRecord/viewRowCnt; 
				if(totalRecord%viewRowCnt >0) 
				totalPage++; 
				request.getSession().removeAttribute("list"); 
				request.getSession().removeAttribute("page"); 
				request.getSession().removeAttribute("totalPage"); 
						   
				request.getSession().setAttribute("list", dao.selectPage(start,end));//4. 영역에 데이터 저장 
				request.getSession().setAttribute("page", page);//현재페이지 
				request.getSession().setAttribute("totalPage", totalPage);//전체페이지 
				 //영역에 데이터 저장하는 이유? 뷰와 공유하기 위해서!!    	   
			}
			return mapping.findForward("success");
		
		}
}
