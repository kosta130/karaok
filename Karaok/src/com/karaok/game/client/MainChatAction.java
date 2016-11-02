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
			//������ ����
			connect();
			
			String currentNickName = (String)request.getSession().getAttribute("currentNickName");
			
			sendMessage("100|"+currentNickName);
			
			 = new Service(s, null);
			
			//���� ���� �޽��� �޴� �κ� �߰�
			
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
			sendMessage("300|"+msg);//"300|�ȳ��ϼ���"
		}
		return forward;
	}

	// ��������
	public void connect() {
		try {
			// Socket s = new Socket(String host, int port);
			s = new Socket("localhost", 3333);
			// ����) ����ǻ��ȣ��Ʈ : "localhost" �Ǵ� "127.0.0.1"
			in = new BufferedReader(new InputStreamReader(s.getInputStream()));
			out = s.getOutputStream();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// connect

	// ������ ���� �޽����� �о TextArea�� �Ѹ���
	// ���� ----------�޽���----------> Ŭ���̾�Ʈ
	public void run() {
		// �� ������? �ؿ� �ִ� �ݺ����� �ٸ� ���μ����� ������ ���ֱ� ���ؼ�
		try {
			while (true) {// �� �ݺ���? ������ ����ؼ� �޽����� ����
				String fromMsg = in.readLine();// fromMsg: ������ ������ �޽���
				// "300|�ȳ��ϼ���" "300|~������" "100|�浿"
				String strArr[] = fromMsg.split("\\|");

				int protocol = Integer.parseInt(strArr[0]);
				switch (protocol) {
				case 100:// ��������
					// String waitNickNames = strArr[1];//"�浿,����,�ֿ�"
					waitInfo.setListData(strArr[1].split(","));
					break;
				case 150:
					// "KOSTA130--1,���ٻ�Ű--2,�ູ��--2"
					if (strArr.length > 1) {// ������ ���� �ִٸ�
						roomInfo.setListData(strArr[1].split(","));
					}
					break;
				case 160:// ��Ÿ��Ʋ�� �����κ��� ����
					cc.setTitle("ä�ù�-[" + strArr[1] + "]");
					break;
				case 300:// ��ȭ�� �Է�
					cc.ta.append(strArr[1] + "\n");// "\n"�� �߰��� ����? TextArea��
													// ���ιٲ�!!
					cc.ta.setCaretPosition(cc.ta.getText().length());
					// ������ũ�ѹٸ� �ڵ����� �����ִ� ���.
				}// switch

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// run

	// Ŭ���̾�Ʈ ---------�޽���----------> ����
	public void sendMessage(String msg) {
		try {
			out.write((msg + "\n").getBytes());
			// "\n"�� �߰��� ����? �޽����� �޴� �ʿ��� Line������ �ޱ� ����!!
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// sendMessage

	public void printWaitInfo(String str) {// ','�� ���еǴ� ���ڿ��� JList���������� �Ѹ���
		// waitInfo.setListData(String []listData);
		waitInfo.setListData(str.split(","));
	}// printWaitInfo
}
