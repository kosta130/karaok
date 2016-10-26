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
	
		@Override
		public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
				HttpServletResponse response) throws Exception {//��ü �Խù� ��ȸ
			FreeBoardDAO dao=new FreeBoardDAO();
			List<FreeBoard> list = dao.listFreeBoard();
			request.setAttribute("list", list);
			
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
			System.out.println("totalRecord: "+ totalRecord); 
			int totalPage = totalRecord/viewRowCnt; 
			if(totalRecord%viewRowCnt >0) 
			totalPage++; 
			request.getSession().removeAttribute("list"); 
			request.getSession().removeAttribute("page"); 
			request.getSession().removeAttribute("totalPage"); 
			list = dao.selectPage(start,end);//dao.selectAll(); 			   
			request.getSession().setAttribute("list", list);//4. ������ ������ ���� 
			request.getSession().setAttribute("page", page);//���������� 
			request.getSession().setAttribute("totalPage", totalPage);//��ü������ 
			 //������ ������ �����ϴ� ����? ��� �����ϱ� ���ؼ�!!    	   
			
			
			return mapping.findForward("success");
		}
}
