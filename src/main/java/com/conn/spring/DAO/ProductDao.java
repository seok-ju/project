package com.conn.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.ProductVO;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int cnt() {
		return sqlSession.selectOne("ProductDAO.cnt");
	}	
	public List<ProductVO> list(){
		return sqlSession.selectList("ProductDAO.list");
	}
	public List<ProductVO> listPop(){
		return sqlSession.selectList("ProductDAO.listPop");
	}
	public List<ProductVO> listOld(){
		return sqlSession.selectList("ProductDAO.listOld");
	}
	
	public int cntKey() {
		return sqlSession.selectOne("ProductDAO.cnt2");
	}
	public List<ProductVO> listKey(){
		return sqlSession.selectList("ProductDAO.list2");
	}
	public List<ProductVO> listKeyPop(){
		return sqlSession.selectList("ProductDAO.listPop2");
	}
	public List<ProductVO> listKeyOld(){
		return sqlSession.selectList("ProductDAO.listOld2");
	}
	
	public int cntCase() {
		return sqlSession.selectOne("ProductDAO.cnt3");
	}
	public List<ProductVO> listCase(){
		return sqlSession.selectList("ProductDAO.list3");
	}
	public List<ProductVO> listCasePop(){
		return sqlSession.selectList("ProductDAO.listPop3");
	}
	public List<ProductVO> listCaseOld(){
		return sqlSession.selectList("ProductDAO.listOld3");
	}
	
	
	public ProductVO select(int proNum) {
		return sqlSession.selectOne("ProductDAO.select", proNum);
	}
	
	public void insert(ProductVO productVO) {
		sqlSession.insert("ProductDAO.insert", productVO);
	}
	
	public void update(ProductVO productVO) {
		sqlSession.update("ProductDAO.update", productVO);
	}
	
	public void delete(int proNum) {
		sqlSession.delete("ProductDAO.delete", proNum);
	}
	
}
