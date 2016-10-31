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
		
		System.out.println("ㅋㅋㅋㅋ");
		
		
		NoticeDAO dao=new NoticeDAO();
		List<NoticeDTO> notice = dao.selectAll();
		request.setAttribute("notice", notice);
		
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
		
		
	
		return mapping.findForward("main");
	}
}
