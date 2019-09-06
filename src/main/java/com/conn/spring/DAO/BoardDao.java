package com.conn.spring.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.BoardVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int cntRe() {
		return sqlSession.selectOne("BoardDAO.cntRe");
	}
	public List<BoardVO> listRe(int start){
		return sqlSession.selectList("BoardDAO.listRe", start);
	}	
	public int cntProRe(int proNum) {
		return sqlSession.selectOne("BoardDAO.cntProRe", proNum);
	}
	public List<BoardVO> listProRe(Map<String, Integer> map){
		return sqlSession.selectList("BoardDAO.listProRe", map);
	}
	
	public int cntQu() {
		return sqlSession.selectOne("BoardDAO.cntQu");
	}
	public List<BoardVO> listQu(int start){
		return sqlSession.selectList("BoardDAO.listQu", start);
	}
	public int cntProQu(int proNum) {
		return sqlSession.selectOne("BoardDAO.cntProQu", proNum);
	}
	public List<BoardVO> listProQu(Map<String, Integer> map){
		return sqlSession.selectList("BoardDAO.listProQu", map);
	}
	
	public BoardVO read(int boNum) {
		return sqlSession.selectOne("BoardDAO.read", boNum);
	}
	
	public void write(BoardVO boardVO) {
		sqlSession.insert("BoardDAO.insert", boardVO);
	}
	public void writeRe(BoardVO boardVO) {
		sqlSession.insert("BoardDAO.insertRe", boardVO);
	}
	
	public void edit(BoardVO boardVO) {
		sqlSession.update("BoardDAO.edit", boardVO);
	}
	
	public void delete(BoardVO boardVO) {
		sqlSession.delete("BoardDAO.delete", boardVO);
	}
	
}
