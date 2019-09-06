package com.conn.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.HostBoardVo;

@Repository
public class HostBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<HostBoardVo> listFAQ(int startIndex){
		return sqlSessionTemplate.selectList("listFAQ", startIndex);
	}
	
	public List<HostBoardVo> listNO(int startIndex){
		return sqlSessionTemplate.selectList("listNO", startIndex);
	}
	
	public List<HostBoardVo> content(int honum){
		return sqlSessionTemplate.selectList("content", honum);
	}
	
	public int listCntFAQ() {
		return sqlSessionTemplate.selectOne("listCntFAQ");
	}
	
	public int listCntNO() {
		return sqlSessionTemplate.selectOne("listCntNO");
	}
	
	public int insert(HostBoardVo vo){
		return sqlSessionTemplate.insert("insert", vo);
	}
	
	public int update(HostBoardVo vo) {
		return sqlSessionTemplate.update("update", vo);
	}
	
	public int delete(int honum) {
		return sqlSessionTemplate.delete("delete", honum);
	}
}