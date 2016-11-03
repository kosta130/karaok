package com.karaok.rank.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.faq.dao.FaqDAO;
import com.karaok.faq.dto.Faq;
import com.karaok.rank.dao.RankDAO;
import com.karaok.rank.dto.Rank;

public class RankAction  extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		String keyword=request.getParameter("keyword");			
	
		RankDAO dao = new RankDAO();
		List<Rank> list;
		if(keyword==null){
			int page=Integer.parseInt(request.getParameter("page"));//�ĸ����ͷ� ���޵� page������
			int viewCnt=10;//�� �������� ������ �� ��
			int end=page*viewCnt; //1��������� 10, 2��������� 20
			int start=end-(viewCnt-1); //1��������� 1 2��������� 11
			int count=dao.selectCount();//�� �Խù� ��	
			int pageCount=Math.floorDiv(count, 10)+1;//�� ������ �� 
			
			
			list =dao.selectAll(start,end);
			request.setAttribute("page", page);//���� ������
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			
		}else{///�˻�
			list = dao.selectRank(keyword);
			request.setAttribute("list", list);
		}
		

		
		return mapping.findForward("success");
	}

}
