package com.karaok.faq.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.faq.dao.FaqDAO;
import com.karaok.faq.dto.Faq;

public class FaqAction_l extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
			String keyword=request.getParameter("keyword");			
			FaqDAO dao=new FaqDAO();
			List<Faq> list;
			if(keyword==null){
				int page=Integer.parseInt(request.getParameter("page"));//파리미터로 전달된 page얻어오기
				int viewCnt=10;//한 페이지에 보여줄 행 수
				int end=page*viewCnt; //1페이지라면 10, 2페이지라면 20
				int start=end-(viewCnt-1); //1페이지라면 1 2페이지라면 11
				int count=dao.selectCount();//총 게시물 수	
				int pageCount=Math.floorDiv(count, 10)+1;//총 페이지 수 
				
				
				list = dao.selectAll(start,end);
				request.setAttribute("page", page);//현재 페이지
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				
			}else{///검색
				list = dao.seletSearch(keyword);
				request.setAttribute("list", list);
			}
		return mapping.findForward("list");
	}
}
