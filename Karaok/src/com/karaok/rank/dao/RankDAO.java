package com.karaok.rank.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
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
	
	
}
