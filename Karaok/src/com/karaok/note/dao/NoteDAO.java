package com.karaok.note.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.note.dto.NoteDTO;

import iba.SqlMapConfig;

public class NoteDAO {
	SqlMapClient smc;

	public NoteDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insert(NoteDTO note) {
		try {
			smc.insert("note.insert", note);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<NoteDTO> selectAll() {
		List<NoteDTO> list = null;
		try {
			list = smc.queryForList("note.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean delete(int num){
		try {
			int t = smc.delete("note.delete", num);
			if(t==1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean update(NoteDTO dto) {
		try {
			int t = smc.update("note.update", dto);
			if(t==1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean hitsup(NoteDTO dto) {

		try {
			int t = smc.update("note.hitsup", dto);
			if(t==1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public NoteDTO select(int num) {
		NoteDTO dto = null;
		try {
			dto = (NoteDTO)smc.queryForObject("note.select", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public int selectCount() {
		int cnt=0;
		try {
			cnt=(int)smc.queryForObject("note.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public List<NoteDTO> selectPage(int start, int end) {
		List<NoteDTO> list = null;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = smc.queryForList("note.selectPage", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
