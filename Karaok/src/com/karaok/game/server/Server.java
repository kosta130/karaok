package com.karaok.game.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import com.karaok.game.client.Room;
import com.karaok.game.client.Service;

public class Server extends Thread {// 소켓서비스준비, 클라이언트 접속 대기!

	ServerSocket ss;

	public Vector<Service> allVC;// 접속된 모든 클라이언트들을 관리(전체 사용자)
	public Vector<Service> waitVC;// 대기실 안의 클라이언트들을 관리(대기실 사용자)

	public Vector<Room> roomVC; // 개설된 방을 관리
	// Room클래스의 속성 ===> Vector<Service> myRoom; (방사용자)

	public Server() {
		try {
			ss = new ServerSocket(3333); // 자신의 ip와 명시된 포트번호로 서버 실행
			allVC = new Vector<>();
			waitVC = new Vector<>();
			roomVC = new Vector<>();

			start();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// Server

	public void run() {
		try {
			System.out.println("채팅 게임 서버 시작...");
			while (true) {
				Socket s = ss.accept();
				// 클라이언트 접속 대기 : new Socket(host,port);에 반응!!
				Service service = new Service(s, this);// Service생성자에게 소켓객체전달!!
				allVC.add(service);// 전체사용자
				waitVC.add(service);// 대기실사용자
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//run

	public static void main(String[] args) {
		new Server();
		System.out.println("게임서버 실행...");
	}
}
