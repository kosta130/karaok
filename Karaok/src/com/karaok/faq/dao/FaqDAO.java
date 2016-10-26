package com.karaok.faq.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.faq.dto.Faq;

import iba.SqlMapConfig;

public class FaqDAO {
	SqlMapClient smc;
	
	public FaqDAO() {
		smc=SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insertFaq(Faq dto){
		
		try {
			smc.insert("faq.insert",dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public List<Faq> selectAll(){
		List<Faq> list=null;
		try {
			list=smc.queryForList("faq.selectAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
