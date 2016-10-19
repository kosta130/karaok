package com.karaok.event.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.event.dto.Event;

import iba.SqlMapConfig;

public class EventDAO {
	SqlMapClient smc;
	
	public EventDAO() {
		smc=SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insertEvent(Event dto){
		try {
			smc.insert("event.insert",dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Event> selectEvent(){
		
		List<Event> list=null;
		try {
		 list = smc.queryForList("event.select");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
