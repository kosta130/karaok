package com.karaok.qna.reply.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.qna.reply.dto.Reply;

import iba.SqlMapConfig;

public class ReplyDAO {
	SqlMapClient smc;
	
	public ReplyDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	
	public boolean insert(Reply reply){
		try {
			smc.insert("reply.add",reply);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean delete(int no){
		try {
			int t = smc.delete("reply.delete",no);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(Reply reply){
		try {
			int t = smc.update("reply.update",reply);
			if(t==1)return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public Reply find(int no){
		Reply reply=null;
		try {
			reply = (Reply) smc.queryForObject("reply.find",no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reply;
	}
	public List<Reply> findAll(){
		List<Reply> list = null;
		try {
			list = smc.queryForList("reply.findAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
