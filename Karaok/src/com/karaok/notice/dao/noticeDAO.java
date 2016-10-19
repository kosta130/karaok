package com.karaok.notice.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.notice.dto.noticeDTO;

import iba.SqlMapConfig;

public class noticeDAO {
	SqlMapClient smc;
	public noticeDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insert(noticeDTO dto){
		try {
			smc.insert("notice.insert",dto);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(int no){
		try {
			int t = smc.delete("notice.delete",no);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(noticeDTO dto){
		try {
			int t = smc.update("notice.update",dto);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public noticeDTO select(int no){
		noticeDTO dto=null;
		try {
			no = (int) smc.queryForObject("notice.select",no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	public List<noticeDTO> findAll(){
		List<noticeDTO> list=null;
		try {
			list = smc.queryForList("notice.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
