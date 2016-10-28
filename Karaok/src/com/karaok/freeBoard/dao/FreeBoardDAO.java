package com.karaok.freeBoard.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.karaok.freeBoard.dto.FreeBoard;
import com.karaok.notice.dto.NoticeDTO;

import iba.SqlMapConfig;

public class FreeBoardDAO {
	 SqlMapClient smc;
	 
	 public FreeBoardDAO() {
		smc = SqlMapConfig.getSqlMapInstance();
	}
	 
	 public boolean insertFreeBoard(FreeBoard dto) {
		 try {
			 smc.insert("free.insert",dto);
			 return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//insertFreeBoard
	 
	 public boolean deleteFreeBoard(int num) {
		try {
			int t = smc.delete("free.delete",num);
			if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}//deleteFreeBoard
	 
	 public boolean updateFreeBoard(FreeBoard dto){
		 try {
			int t =smc.update("free.update",dto);
			 if(t==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }//updateFreeBoard
	 
	 public FreeBoard selectFreeBoard(int num){//수정폼에 보여질 데이터 출력
		 FreeBoard dto = null;
		 try {
			dto=(FreeBoard)smc.queryForObject("free.select",num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return dto;
	 }//selectFreeBoard
	 
	 public List<FreeBoard> listFreeBoard(){//글목록에 보여질 정보 출력
		 List<FreeBoard> list=null;
		 try {
			list=smc.queryForList("free.selectAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return list;
	 }//listFreeBoard
	 
	 public int selectCount() {
			int cnt = 0;
			try {
				cnt = (int) smc.queryForObject("free.selectCount");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;

		}
	 
	 public List<FreeBoard> selectPage(int start, int end) {
			List<FreeBoard> list = null;
			try {
				Map<String, Integer> map = new HashMap<>();
				map.put("start", start);
				map.put("end", end);
				list = smc.queryForList("free.selectPage", map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}

}
