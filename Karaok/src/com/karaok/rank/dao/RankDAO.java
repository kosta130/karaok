package com.karaok.rank.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.note.dto.NoteDTO;
import com.karaok.rank.dto.Rank;

import iba.SqlMapConfig;

public class RankDAO {
	SqlMapClient smc;
	
	public RankDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public List<Rank> selectAll(){
		List<Rank> list = null;
		try {
			list=smc.queryForList("rank.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int selectCount() {
		int cnt=0;
		try {
			cnt=(int)smc.queryForObject("rank.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public List<Rank> selectPage(int start, int end) {
		List<Rank> list = null;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = smc.queryForList("rank.selectPage", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<Rank> selectSearch(String keyword) {
		List<Rank> list = null;
		try {
			list = smc.queryForList("rank.selectSearch", keyword);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
