package com.karaok.event.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.event.dto.Event;
import com.karaok.event.dto.EventReply;

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
	
	public boolean deleteEvent(int num){
		try {
			smc.delete("event.delete",num);
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
	
	public List<Event> selectIng(){
		List<Event> listIng=null;
		try {
			listIng = smc.queryForList("event.selectIng");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listIng;
		
	}
	
	public List<Event> selectEnd(){
		List<Event> listEnd=null;
		try {
	
			listEnd = smc.queryForList("event.selectEnd");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listEnd;
		
	}
	
	public Event seletConfirm(int num){
		Event dto=null;
		try {
			dto=(Event)smc.queryForObject("event.selectConfirm",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public Event previous(int num){
		Event dto=null;
		
		try {
			dto =(Event)smc.queryForObject("event.previous",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public Event next(int num){
		Event dto=null;
		try {
		dto =(Event)smc.queryForObject("event.next",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	//´ñ±Û µî·Ï
	public boolean insertReply(EventReply dto){
		
		try {
			smc.insert("event.insertReply",dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public EventReply selectReply(String contents){
		EventReply dto1=null;
		try {
			dto1= (EventReply)smc.queryForObject("event.selectReply",contents);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto1;
	}
}
