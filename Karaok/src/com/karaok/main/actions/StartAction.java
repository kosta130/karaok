package com.karaok.main.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.event.dao.EventDAO;
import com.karaok.event.dto.Event;
import com.karaok.faq.dao.FaqDAO;
import com.karaok.faq.dto.Faq;
import com.karaok.freeBoard.dao.FreeBoardDAO;
import com.karaok.freeBoard.dto.FreeBoard;
import com.karaok.note.dao.NoteDAO;
import com.karaok.note.dto.NoteDTO;
import com.karaok.notice.dao.NoticeDAO;
import com.karaok.notice.dto.NoticeDTO;

public class StartAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		//공지사항 불러오기
		NoticeDAO dao=new NoticeDAO();
		List<NoticeDTO> notice = dao.selectAll();
		request.setAttribute("notice", notice);
		
		//개발자노트 불러오기
		NoteDAO dao1=new NoteDAO();
		List<NoteDTO> note= dao1.selectAll();
		request.setAttribute("note", note);
		
		//자유게시판 불러오기
		FreeBoardDAO dao3=new FreeBoardDAO();
		List<FreeBoard> free = dao3.listFreeBoard();
		request.setAttribute("free", free);
		
		//이벤트게시판 불러오기
		EventDAO dao4=new EventDAO();
		List<Event> listIng = dao4.selectIng();
		request.setAttribute("listIng", listIng);
		
		//FAQ게시판 불러오기
		FaqDAO dao5=new FaqDAO();
		List<Faq> faq = dao5.selectAll(1, 5);
		request.setAttribute("faq", faq);
		
		
		
	
		return mapping.findForward("main");
	}
}
