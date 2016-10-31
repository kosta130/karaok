package com.karaok.qna.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.qna.dto.QnaDTO;
import com.karaok.qna.dto.ReplyDTO;

import iba.SqlMapConfig;

public class QnaDAO {
	SqlMapClient smc;

	public QnaDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}

	public boolean insert(QnaDTO dto) {
		try {
			smc.insert("qna.insert", dto);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean delete(int num) {
		try {
			int t = smc.delete("qna.delete", num);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(QnaDTO dto) {
		try {
			int t = smc.update("qna.update", dto);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public QnaDTO select(int num) {
		QnaDTO dto = null;
		try {
			dto = (QnaDTO) smc.queryForObject("qna.select", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	public List<QnaDTO> selectAll() {
		List<QnaDTO> list = null;
		try {
			list = smc.queryForList("qna.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int selectCount() {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("qna.selectCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;

	}

	public List<QnaDTO> selectPage(int start, int end) {
		List<QnaDTO> list = null;
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = smc.queryForList("qna.selectPage", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//´ñ±Û µî·Ï
	public boolean insertReply(ReplyDTO dto){
		
		try {
			smc.insert("qna.insertReply",dto);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<ReplyDTO> ListReply(int num){
		 List<ReplyDTO> list=null;
		try {
			list= (List<ReplyDTO>)smc.queryForList("qna.ListReply",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean deleteReply(int num) {
		try {
			int t = smc.delete("qna.deleteReply", num);
			if (t == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	} 

}
