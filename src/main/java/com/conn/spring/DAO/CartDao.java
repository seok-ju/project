package com.conn.spring.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.CartVO;

@Repository
public class CartDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CartVO select(int num) {
		return sqlSession.selectOne("CartDAO.select", num);
	}
	
	public void insert(CartVO cartVO) {
		sqlSession.insert("CartDAO.insert", cartVO);
	}
	
	public void update(CartVO cartVO) {
		sqlSession.update("CartDAO.update", cartVO);
	}
	
	public void delete(int num) {
		sqlSession.delete("CartDAO.delete", num);
	}
}
