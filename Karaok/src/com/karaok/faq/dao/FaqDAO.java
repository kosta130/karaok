package com.karaok.faq.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<Faq> selectAll(int start, int end){
		List<Faq> list=null;
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		try {
			list=smc.queryForList("faq.selectAll",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Faq> seletSearch(String keyword){
		List<Faq> list=null;
		try {
			list = smc.queryForList("faq.selectSearch",keyword);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시물 카운트
	public int selectCount(){
		int count;
		try {
			count=(Integer)smc.queryForObject("faq.selectCount");
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
