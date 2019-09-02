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
	
	public List<ProductVO> search(String proName){
		return sqlSession.selectList("ProductDAO.search", proName);
	}
	public int searchCnt(String proName) {
		return sqlSession.selectOne("ProductDAO.searchcnt", proName);
	}	
	
	public int cnt() {
		return sqlSession.selectOne("ProductDAO.cnt");
	}	
	public List<ProductVO> list(int start){
		return sqlSession.selectList("ProductDAO.list", start);
	}
	public List<ProductVO> listPop(int start){
		return sqlSession.selectList("ProductDAO.listPop", start);
	}
	public List<ProductVO> listOld(int start){
		return sqlSession.selectList("ProductDAO.listOld", start);
	}
	
	public int cntKey() {
		return sqlSession.selectOne("ProductDAO.cnt2");
	}
	public List<ProductVO> listKey(int start){
		return sqlSession.selectList("ProductDAO.list2", start);
	}
	public List<ProductVO> listKeyPop(int start){
		return sqlSession.selectList("ProductDAO.listPop2", start);
	}
	public List<ProductVO> listKeyOld(int start){
		return sqlSession.selectList("ProductDAO.listOld2", start);
	}
	
	public int cntCase() {
		return sqlSession.selectOne("ProductDAO.cnt3");
	}
	public List<ProductVO> listCase(int start){
		return sqlSession.selectList("ProductDAO.list3", start);
	}
	public List<ProductVO> listCasePop(int start){
		return sqlSession.selectList("ProductDAO.listPop3", start);
	}
	public List<ProductVO> listCaseOld(int start){
		return sqlSession.selectList("ProductDAO.listOld3", start);
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
	public void priceChange(ProductVO productVO, int proNum) {
		insert(productVO);
		sqlSession.update("flag", proNum);
	}
	
	public void delete(int proNum) {
		sqlSession.delete("ProductDAO.delete", proNum);
	}	
}
