package com.karaok.game.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Vector;

import com.karaok.game.server.Server;

public class Service extends Thread {// ������ ���� ����� ����!!

	BufferedReader in;
	OutputStream out; // ���� ���� �Է�, ��� ��ü ����

	Vector<Service> allVC; // ��ü �����
	Vector<Service> waitVC; // ���� �����
	Vector<Room> roomVC; // ������ ��

	String nickName; // Ŭ���̾�Ʈ�� ��ȭ��
	Room myRoom;// Service�� Ŭ���̾�Ʈ �Ѹ��� �ǹ���, Ŭ���̾�Ʈ�� ���� ���� ����

	/*
	 * <�츮�鸸�� ���� ��űԾ�-protocol> 100: ��������
	 * 
	 * 200: ��ȭ������ 250: ��ȭ������
	 * 
	 * 300: �޽�������(��ȭ�� ä��)
	 * 
	 * 400: ��ȭ����
	 * 
	 * 900: ���α׷�����
	 */

	public Service(Socket s, Server server) {
		try {
			in = new BufferedReader(new InputStreamReader(s.getInputStream()));
			out = s.getOutputStream();

			// this.server = server; //new Server();
			allVC = server.allVC;
			waitVC = server.waitVC;
			roomVC = server.roomVC;

			start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//Ŭ���̾�Ʈ�� sendTF�� ���� ������ �޽��� �б�!!
    @Override
    public void run() {
       try {
		while(true){
			  String fromMsg = in.readLine(); 
			  System.out.println("fromMsg >> "+ fromMsg);
			  //"100|�浿"   "300|�ȳ��ϼ���"   "400|���"
			  String [] dataArr = fromMsg.split("\\|");
			     // '|'�� �������� ���ڿ� �и� ===> ���ڿ��迭
			  
			  int protocol = Integer.parseInt(dataArr[0]);// "100" ---> 100
			  System.out.println("from Client : "+protocol);
		   switch(protocol){
		      case 100://��������, ��ȭ������
		    	   nickName = dataArr[1];//String nickName="�浿";
		    	   messageWait("100|"+getWaitNickNames());
		    	   messageWait("150|"+getRoomInfo());
		    	   break;
		    	   
		      case 150://��ȭ�氳��
		    	   String title = dataArr[1];
		    	   Room room = new Room(title, 1, nickName);
		    	     myRoom = room; //���λ����� �������� ���� myRoom�� ����
		    	   roomVC.add(room);//���� ������ ���� �������� ����!!
		    	   //���� ----> Ŭ���̾�Ʈ  :   "KOSTA130--1,���ٻ�Ű--2,�ູ��--2"
		    	   
		    	          //���� -----> ��ȭ������ �̵�
	//Service(Ŭ���̾�Ʈ)   remove         add
		    	   waitVC.remove(this);
		    	   myRoom.vc.add(this);
		    	   
		    	   String roomInfo = getRoomInfo();
		    	   messageWait("150|"+roomInfo);
		    	   messageRoom("300| #### ["+nickName+"]�� ���� ####");//~�� ����
		    	   messageTo("160|"+myRoom.title);//��Ÿ��Ʋ����
		    	   
		    	   break;
		      case 200://���� ��ȭ������
		    	   String sTitle = dataArr[1];//sTitle:�����ϴ� ���� �̸�
		    	 
		    	   for(int i=0; i<roomVC.size(); i++){//�����ϴ� ���� ����ŭ
		    		  Room r = roomVC.get(i);		    		 
		    		  if(r.title.equals(sTitle)){//��ġ�ϴ� �������� ã�Ҵٸ�!!		    			
		    			  myRoom = r; 	    			  
		    		  }
		    	   }
		    	   
		    	   //���� ----> ��ȭ��
		    	   waitVC.remove(this);
		    	   myRoom.vc.add(this);
		    	   myRoom.count++;
		    	   
		    	   messageRoom("300| #### ["+nickName+"]�� ���� ####");//~�� ����
		    	   messageTo("160|"+myRoom.title);//��Ÿ��Ʋ����
		    	   
		    	   break;
		      case 300://��ȭ��������
		    	  messageRoom("300|["+nickName+"]�� "+ dataArr[1]);
		    	      //[�浿]��  �ȳ��ϼ���
		    	  break;
		      case 400://�����ȭ������
		    	  nickName = dataArr[1];//String nickName="���";
		    	  break;
		   }
			  
			  
		   }
	    } catch (IOException e) {
		e.printStackTrace();
	   }
    }//run
    
    public void messageAll(String msg){//��ü Ŭ���̾�Ʈ���� �޽����� ������!!
    	for(int i=0; i< allVC.size(); i++){//���Ϳ��� �����Ǵ� Ŭ���̾�Ʈ ����ŭ
    		try {
				Service ser = allVC.get(i);
				ser.messageTo(msg);
			} catch (IOException e) {
				System.out.println("Ŭ���̾�Ʈ�� ���� ����!!");
				//������ ���� Ŭ���̾�Ʈ�� ���Ϳ��� ����!!
				allVC.remove(i--);			    
			}
    	}//for
    }//messageAll
    
    public void messageWait(String msg){//���� Ŭ���̾�Ʈ���� �޽����� ������!!
    	for(int i=0; i< waitVC.size(); i++){//���Ϳ��� �����Ǵ� Ŭ���̾�Ʈ ����ŭ
    		try {
    			Service ser = waitVC.get(i);
    			ser.messageTo(msg);
    		} catch (IOException e) {
    			System.out.println("Ŭ���̾�Ʈ�� ���� ����!!");
    			//������ ���� Ŭ���̾�Ʈ�� ���Ϳ��� ����!!
    			waitVC.remove(i--);			    
    		}
    	}//for
    }//messageWait
    
    public void messageRoom(String msg){
    	 //Ư������� Ŭ���̾�Ʈ���� �޽����� ������!!
    	for(int i=0; i< myRoom.vc.size(); i++){//���Ϳ��� �����Ǵ� Ŭ���̾�Ʈ ����ŭ
    		try {
    			Service ser = myRoom.vc.get(i);
    			ser.messageTo(msg);
    		} catch (IOException e) {
    			System.out.println("Ŭ���̾�Ʈ�� ���� ����!!");
    			//������ ���� Ŭ���̾�Ʈ�� ���Ϳ��� ����!!
    			myRoom.vc.remove(i--);			    
    		}
    	}//for
    }//messageAll
    
    
    
    
    
    public void messageTo(String msg) throws IOException {
    	//�Ѱ��� Ŭ���̾�Ʈ���� �޽����� ������(�����޽�������)
    	out.write( (msg+"\n").getBytes() );
    }//messageTo
	
    public String getWaitNickNames(){//��ü������ �̸��� ������ 
    	                           //String names= "�浿,����,�ֿ�,����"
    	                           //         i      0     1    2   3
       String names="";
       for(int i=0; i< waitVC.size(); i++){
    	   Service service = waitVC.get(i);
    	   names += service.nickName;
    	   if(i<waitVC.size()-1)names +=",";
       }
       return names;
    }//getWaitNickNames
    
    public String getRoomInfo(){//��ü ������ ���� ����
    	//String names= "KOSTA130--1,���ٻ�Ű--2,�ູ��--2"
    	//         i         0            1          2   
    	String roomInfo="";
    	for(int i=0; i< roomVC.size(); i++){
    		Room room = roomVC.get(i);
    		roomInfo += room.title +"--"+ room.count;
    		if(i<roomVC.size()-1)roomInfo +=",";
    	}
    	return roomInfo;
    }//getRoomInfo
}
