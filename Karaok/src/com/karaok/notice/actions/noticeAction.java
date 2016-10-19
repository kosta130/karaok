package com.karaok.notice.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.karaok.notice.dao.noticeDAO;
import com.karaok.notice.dto.noticeDTO;

public class noticeAction extends Action {
   @Override
   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      noticeDAO dao = new  noticeDAO();
      
      String action = request.getParameter("action");
      
      ActionForward forward = mapping.findForward("list");
      
      if(action.equals("insert")){// 글입력 요청 action="insert"
         noticeDTO dto = new noticeDTO(0,
                           request.getParameter("nickname"),
                           request.getParameter("subject"),
                           request.getParameter("contents"),null);
         dao.insert(dto);               
                           
      }else if(action.equals("upform")){// 글수정폼 요청 action="upform"
         int no = Integer.parseInt(request.getParameter("num"));
         noticeDTO dto = dao.select(no);
         dto.setNo(no);
         request.setAttribute("dto", dto);
         forward = mapping.findForward("upform");
         
      }else if(action.equals("update")){// 글수정 요청 action="update"
         noticeDTO dto = new noticeDTO(Integer.parseInt(request.getParameter("no")),
               request.getParameter("nickname"),
               request.getParameter("subject"),
               request.getParameter("contents"),null);
         
         dao.update(dto);
         
      }else if(action.equals("delete")){// 글삭제 요청 action="delete"
         int no = Integer.parseInt(request.getParameter("no"));
         dao.delete(no);
      }
      return forward;
   }
}