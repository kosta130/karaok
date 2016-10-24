package com.karaok.main.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import iba.SqlMapConfig;

public class MemberDAO {
	SqlMapClient smc;
	
	public MemberDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public int selectCount(String id){
		int count = -1;
		try {
			count=(int)smc.queryForObject("member.selectCount", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public int selectNickNameCount(String nickName){
		int count = -1;
		try {
			count=(int)smc.queryForObject("member.selectNickNameCount", nickName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
