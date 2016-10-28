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
				 list  =dao.selectAll();
				 request.setAttribute("list", list);
			}else{
				list = dao.seletSearch(keyword);
				request.setAttribute("list", list);
			}
		return mapping.findForward("list");
	}
}
