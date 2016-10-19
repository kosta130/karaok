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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EventAction extends Action {
	
	DefaultFileRenamePolicy dfr;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int maxSize=5*1024*1024;	
		String saveDirectory=request.getRealPath("img");//저장경로
		MultipartRequest mr=
				new MultipartRequest(request, saveDirectory,maxSize,"UTF-8",
						new DefaultFileRenamePolicy());
		
		
		String id="lee52x@naver.com";
		String subject=mr.getParameter("subject");
		String name=mr.getParameter("name");
		String contents=mr.getParameter("contents");
		Date startDate=mr.getParameter("startDate");//"10/19/2016"
		String endDate=mr.getParameter("endDate");
		String fileName=mr.getFilesystemName("fileName");
		
		
		
		
		System.out.println(subject);
		System.out.println(name);
		System.out.println(contents);
		System.out.println(fileName);
		System.out.println(startDate);
		System.out.println(endDate);

		
		
		Event dto=new Event();
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContents(contents);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setFileName(fileName);
		
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
