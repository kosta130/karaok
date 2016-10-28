package com.karaok.event.actions;


import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;
import com.karaok.event.model.EventModel;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EventAction_c extends Action {
	
	DefaultFileRenamePolicy dfr;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		String id=(String)request.getSession().getAttribute("currentId");
		request.getSession().getAttribute("currentNickName");
		
		
		int maxSize=5*1024*1024;	
		String saveDirectory=request.getRealPath("img");//저장경로
		MultipartRequest mr=
				new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",
						new DefaultFileRenamePolicy());

		
		String subject=mr.getParameter("subject");
		String name=mr.getParameter("name");
		String contents=mr.getParameter("contents");
		String sDate=mr.getParameter("startDate");//"10/19/2016"
		String eDate=mr.getParameter("endDate");
		String point=mr.getParameter("point");
		String fileName=mr.getFilesystemName("fileName");
		
		
		EventModel m = new EventModel();
		String startDate=m.dateConfirm(sDate);
		String endDate=m.dateConfirm(eDate);
		String state=m.dateCompare(endDate);

		Event dto=new Event();
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContents(contents);
		dto.setStartDate(startDate.substring(0,10));
		dto.setEndDate(endDate.substring(0,10));
		dto.setFileName(fileName);
		dto.setPoint(point);
		dto.setState(state);

		EventDAO dao=new EventDAO();
		boolean result=dao.insertEvent(dto);
		
		if(result==true){
			EventDAO dao1=new EventDAO();
			List<Event> list = null;
			list=dao1.selectEvent();
			request.setAttribute("list", list);
			return mapping.findForward("success");
		}else{
			System.out.println("db입력실패");
		}
		
		
		return mapping.findForward("success");
	}
	
}
