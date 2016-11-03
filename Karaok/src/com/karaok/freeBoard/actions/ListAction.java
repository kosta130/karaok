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
				HttpServletResponse response) throws Exception {//��ü �Խù� ��ȸ
			FreeBoardDAO dao=new FreeBoardDAO();
			action = request.getParameter("action");
			
			
			if(action==null || action.equals("list")){ 
				 
				
				//������ ���� ������ 
				String pageStr = request.getParameter("page"); 
						           
				int page=1;//�⺻�������� 1�������� �ϰڴ�!! 
					    	   
				int viewRowCnt=10;//�� �������� ������ ��(���ڵ�)�� �� 
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
						   
				request.getSession().setAttribute("list", dao.selectPage(start,end));//4. ������ ������ ���� 
				request.getSession().setAttribute("page", page);//���������� 
				request.getSession().setAttribute("totalPage", totalPage);//��ü������ 
				 //������ ������ �����ϴ� ����? ��� �����ϱ� ���ؼ�!!    	   
			}
			return mapping.findForward("success");
		
		}
}
