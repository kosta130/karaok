package com.karaok.rank.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.rank.dao.RankDAO;
import com.karaok.rank.dto.Rank;

public class RankAction  extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		RankDAO dao = new RankDAO();
		List<Rank> list = dao.selectAll();
		
		request.getSession().setAttribute("list", list);
		
		return mapping.findForward("success");
	}

}
