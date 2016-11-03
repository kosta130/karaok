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

	public List<QnaDTO> selectAll(String nickname) {
		List<QnaDTO> list = null;
		try {
			list = smc.queryForList("qna.selectAll",nickname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<QnaDTO> selectMAll(String nickname) {
		List<QnaDTO> list = null;
		try {
			list = smc.queryForList("qna.selectMAll",nickname);
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
	
	//댓글 등록
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
	
	public boolean hitsup(QnaDTO dto){
		
		try {
			int t = smc.update("qna.hitsUpdate",dto);
			if(t==1)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean addReplyCount(int num){//리플카운트 증가
		try {
			smc.update("qna.addReplyCount",num);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public List<QnaDTO> selectAdminAll(){
		List<QnaDTO> list=null;
		try {
			list = smc.queryForList("qna.selectAdminAll");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
