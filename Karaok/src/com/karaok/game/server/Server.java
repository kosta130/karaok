package com.karaok.game.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

import com.karaok.game.client.Room;
import com.karaok.game.client.Service;

public class Server extends Thread {// ���ϼ����غ�, Ŭ���̾�Ʈ ���� ���!

	ServerSocket ss;

	public Vector<Service> allVC;// ���ӵ� ��� Ŭ���̾�Ʈ���� ����(��ü �����)
	public Vector<Service> waitVC;// ���� ���� Ŭ���̾�Ʈ���� ����(���� �����)

	public Vector<Room> roomVC; // ������ ���� ����
	// RoomŬ������ �Ӽ� ===> Vector<Service> myRoom; (������)

	public Server() {
		try {
			ss = new ServerSocket(3333); // �ڽ��� ip�� ��õ� ��Ʈ��ȣ�� ���� ����
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
			System.out.println("ä�� ���� ���� ����...");
			while (true) {
				Socket s = ss.accept();
				// Ŭ���̾�Ʈ ���� ��� : new Socket(host,port);�� ����!!
				Service service = new Service(s, this);// Service�����ڿ��� ���ϰ�ü����!!
				allVC.add(service);// ��ü�����
				waitVC.add(service);// ���ǻ����
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//run

	public static void main(String[] args) {
		new Server();
		System.out.println("���Ӽ��� ����...");
	}
}
