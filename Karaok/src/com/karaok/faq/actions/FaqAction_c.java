package com.karaok.faq.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.faq.dao.FaqDAO;
import com.karaok.faq.dto.Faq;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FaqAction_c extends Action {
	DefaultFileRenamePolicy dfr;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String id=(String)request.getSession().getAttribute("currentId");
		request.getSession().getAttribute("currentNickName");
		
		int maxSize=5*1024*1024;
		String saveDirectory=request.getRealPath("img");//저장경로
		MultipartRequest mr=
					new MultipartRequest(request,saveDirectory,maxSize,"UTF-8",
								new DefaultFileRenamePolicy());	
		
		
		String subject=mr.getParameter("subject");
		String contents=mr.getParameter("contents");
		contents=contents.replace("/r/n", "<br>");
		String options=mr.getParameter("options");
		String fileName=mr.getFilesystemName("fileName");
			
		Faq dto=new Faq();
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContents(contents);
		dto.setFileName(fileName);
		dto.setOptions(options);
		
		FaqDAO dao=new FaqDAO();
		if(dao.insertFaq(dto)){
			System.out.println("db입력 성공");
		}else{
			System.out.println("db입력 실패");
		}
		
	
		
		
		return mapping.findForward("create");
	}
}
