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
import com.karaok.screen.dao.ScreenDAO;
import com.karaok.screen.dto.Screen;

public class StartAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		//�������� �ҷ�����
		NoticeDAO dao=new NoticeDAO();
		List<NoticeDTO> notice = dao.selectMAll();
		request.setAttribute("notice", notice);
		
		//�����ڳ�Ʈ �ҷ�����
		NoteDAO dao1=new NoteDAO();
		List<NoteDTO> note= dao1.selectMAll();
		request.setAttribute("note", note);
		
		//�����Խ��� �ҷ�����
		FreeBoardDAO dao3=new FreeBoardDAO();
		List<FreeBoard> free = dao3.MlistFreeBoard();
		request.setAttribute("free", free);
		
		//�̺�Ʈ�Խ��� �ҷ�����
		EventDAO dao4=new EventDAO();
		List<Event> listIng = dao4.selectMIng();
		request.setAttribute("listIng", listIng);
		
		//FAQ�Խ��� �ҷ�����
		FaqDAO dao5=new FaqDAO();
		List<Faq> faq = dao5.selectAll(1, 5);
		request.setAttribute("faq", faq);
		
		//��ũ�����Խ��� �ҷ�����
		ScreenDAO dao6=new ScreenDAO();
		List<Screen> screen = dao6.MlistScreenBoard();
		request.setAttribute("screen", screen);
		
		
		
	
		return mapping.findForward("main");
	}
}
