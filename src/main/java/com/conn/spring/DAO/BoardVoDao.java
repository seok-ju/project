package com.conn.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.BoardVO;

@Repository
public class BoardVoDao {
	@Autowired	
	private SqlSessionTemplate sqlSessionTemplate;
		
		public BoardVoDao(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}

		public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
				this.sqlSessionTemplate =sqlSessionTemplate;
		}
		
		public List<BoardVO> list(){
				return sqlSessionTemplate.selectList("list");
		}
		
		public List<BoardVO> listme(){
			return sqlSessionTemplate.selectList("listme");
		}
		
		public int delete(BoardVO boardVO) {
				return sqlSessionTemplate.delete("delete", boardVO);
		}
		public int update(BoardVO boardVO) {
				return sqlSessionTemplate.update("update", boardVO);
		}
		public void insert(BoardVO boardVO) {
				 sqlSessionTemplate.insert("insert", boardVO);
		}
		
		public void insertme(BoardVO boardVO) {
			 sqlSessionTemplate.insert("insertme", boardVO);
		}
		
		public BoardVO select(int BoNum) {
				BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", BoNum);
				return vo;
		}
		public int updateRE(BoardVO boardVO) {
			return sqlSessionTemplate.update("updateRE", boardVO);
		}
		
		public void updateRef(int boNum) {
			sqlSessionTemplate.update("updateRef", boNum);
		}

}
