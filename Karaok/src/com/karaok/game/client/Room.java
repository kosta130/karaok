package com.karaok.game.client;

import java.util.Vector;

public class Room {//��������(���� �ٸ�) ä�ù��� ǥ���ϴ� ��ü
    //���� ǥ���ϴ� �Ӽ�
	String title;//���̸�
	int count;//�ο���
	String master;//����(���� ������ ���)
	
	Vector<Service> vc;//���� ���� �濡 �ִ� ������(Ŭ���̾�Ʈ)
	
	public Room(String title, int count, String master) {
		this.title = title;
		this.count = count;
		this.master = master;
		
		vc = new Vector<>();
	}//������	
}
