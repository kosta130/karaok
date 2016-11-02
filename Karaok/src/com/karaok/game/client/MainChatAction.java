package com.karaok.game.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class MainChatAction extends Action {
	BufferedReader in;
	OutputStream out;
	Socket s;
	Service service;
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = mapping.findForward("fail");

		String action = request.getParameter("action");
		
		
		if(action!=null && action.equals("joinGame")){
			//서버와 연결
			connect();
			
			String currentNickName = (String)request.getSession().getAttribute("currentNickName");
			
			sendMessage("100|"+currentNickName);
			
			 = new Service(s, null);
			
			//서버 전달 메시지 받는 부분 추가
			
			forward = mapping.findForward("success");
		}else if(action!=null && action.equals("bt_create")){
			String room_title = request.getParameter("room_title");
			sendMessage("150|"+room_title);//"150|KOSTA130"
			
			forward = mapping.findForward("success");
		}else if(action!=null && action.equals("bt_enter")){
			String sValue = request.getParameter("room_info");
			String room_title = sValue.substring(0, sValue.indexOf("--"));
			
			sendMessage("200|"+room_title);	
		}else if(action!=null && action.equals("bt_exit")){
			//
		}else if(action!=null && action.equals("sendTF")){
			String msg = (String)request.getAttribute("msg");
			sendMessage("300|"+msg);//"300|안녕하세요"
		}
		return forward;
	}

	// 서버연결
	public void connect() {
		try {
			// Socket s = new Socket(String host, int port);
			s = new Socket("localhost", 3333);
			// 참고) 내컴퓨터호스트 : "localhost" 또는 "127.0.0.1"
			in = new BufferedReader(new InputStreamReader(s.getInputStream()));
			out = s.getOutputStream();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// connect

	// 서버가 보낸 메시지를 읽어서 TextArea에 뿌리기
	// 서버 ----------메시지----------> 클라이언트
	public void run() {
		// 왜 스레드? 밑에 있는 반복문이 다른 프로세스에 영향을 안주기 위해서
		try {
			while (true) {// 왜 반복문? 서버는 계속해서 메시지를 전달
				String fromMsg = in.readLine();// fromMsg: 서버가 전달한 메시지
				// "300|안녕하세요" "300|~님입장" "100|길동"
				String strArr[] = fromMsg.split("\\|");

				int protocol = Integer.parseInt(strArr[0]);
				switch (protocol) {
				case 100:// 대기실입장
					// String waitNickNames = strArr[1];//"길동,라임,주원"
					waitInfo.setListData(strArr[1].split(","));
					break;
				case 150:
					// "KOSTA130--1,오바사키--2,행복방--2"
					if (strArr.length > 1) {// 개설된 방이 있다면
						roomInfo.setListData(strArr[1].split(","));
					}
					break;
				case 160:// 방타이틀이 서버로부터 전달
					cc.setTitle("채팅방-[" + strArr[1] + "]");
					break;
				case 300:// 대화를 입력
					cc.ta.append(strArr[1] + "\n");// "\n"을 추가한 이유? TextArea에
													// 라인바꿈!!
					cc.ta.setCaretPosition(cc.ta.getText().length());
					// 수직스크롤바를 자동으로 내려주는 기능.
				}// switch

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// run

	// 클라이언트 ---------메시지----------> 서버
	public void sendMessage(String msg) {
		try {
			out.write((msg + "\n").getBytes());
			// "\n"을 추가한 이유? 메시지를 받는 쪽에서 Line단위로 받기 때문!!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// sendMessage

	public void printWaitInfo(String str) {// ','로 구분되는 문자열을 JList대기실정보에 뿌리기
		// waitInfo.setListData(String []listData);
		waitInfo.setListData(str.split(","));
	}// printWaitInfo
}
