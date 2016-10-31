package com.karaok.screen.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.screen.dto.Screen;
import com.karaok.screen.dto.ScreenReply;

import iba.SqlMapConfig;

public class ScreenDAO {
	SqlMapClient smc;
	
	public ScreenDAO () {
		smc= SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insertScreen(Screen dto){
		try {
			 smc.insert("screen.insert",dto);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Screen> listScreenBoard() {//����Ʈ�� ������ ���� ���
		List<Screen> list = null;
		try {
			list= smc.queryForList("screen.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Screen selectScreen(int num) {//��ȭ��, �������� ������ ���
		Screen dto = null;
		try {
			dto=(Screen) smc.queryForObject("screen.select",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	public boolean updateScreen(Screen dto){//���� ������ ���
		 try {
			int t =smc.update("screen.update",dto);
			 if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	public boolean deleteScreen(int num) {
		try {
			int t = smc.delete("screen.delete",num);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public int selectCount() {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("screen.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;

	}
 
 public List<Screen> selectPage(int start, int end) {
		List<Screen> list = null;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = smc.queryForList("screen.selectPage", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
 
 	public boolean seekCount(Screen dto) {//��ȸ��
		int t;
		try {
			t = smc.update("screen.seekCount",dto);
			if(t==1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
 	public boolean insertReply(ScreenReply re_dto){//��� �ޱ�
 		try {
			smc.insert("screen.insertReply",re_dto);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
 		return false;
 	}
 	public List<ScreenReply> ListReply(int num){//��� ���
 		List<ScreenReply> list=null;
 		try {
			list= smc.queryForList("screen.ListReply",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
 		return list;
 	}
}
