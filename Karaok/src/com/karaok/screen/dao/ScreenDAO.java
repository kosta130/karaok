package com.karaok.screen.dao;


import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.screen.dto.Screen;

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

}
