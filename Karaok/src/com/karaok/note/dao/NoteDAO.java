package com.karaok.note.dao;

import java.sql.SQLException;
import java.util.List;

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
	
}
