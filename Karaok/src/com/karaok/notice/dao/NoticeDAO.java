package com.karaok.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.notice.dto.NoticeDTO;

import iba.SqlMapConfig;

public class NoticeDAO {
	SqlMapClient smc;
	
	public NoticeDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insert(NoticeDTO dto){
		try {
			smc.insert("notice.insert",dto);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(int num){
		try {
			int t = smc.delete("notice.delete",num);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(NoticeDTO dto){
		try {
			int t = smc.update("notice.update",dto);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public NoticeDTO select(int num){
		NoticeDTO dto=null;
		try {
			num = (int) smc.queryForObject("notice.select",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	public List<NoticeDTO> selectAll(){
		List<NoticeDTO> list=null;
		try {
			list = smc.queryForList("notice.selectAll");
			for (int i = 0; i < list.size(); i++) {
				System.out.println("listNick="+list.get(i).getNickname());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}