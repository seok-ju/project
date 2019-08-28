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
		public int delete(BoardVO boardVO) {
				return sqlSessionTemplate.delete("delete", boardVO);
		}
		public int update(BoardVO boardVO) {
				return sqlSessionTemplate.update("update", boardVO);
		}
		public void insert(BoardVO boardVO) {
				 sqlSessionTemplate.insert("insert", boardVO);
		}
		public BoardVO select(int BoNum) {
				BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", BoNum);
				return vo;
		}
		

}
