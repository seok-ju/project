package com.conn.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.ProductDao;
import com.conn.spring.VO.ProductVO;

@Service
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public List<ProductVO> search(String proName){
		return productDao.search(proName);
	}
	public int searchCnt(String proName) {
		return productDao.searchCnt(proName);
	}
	
	public int cnt() {
		return productDao.cnt();
	}
	public List<ProductVO> list(int start){
		return productDao.list(start);
	}
	public List<ProductVO> listPop(int start){
		return productDao.listPop(start);
	}
	public List<ProductVO> listOld(int start){
		return productDao.listOld(start);
	}
	
	public int cntKey() {
		return productDao.cntKey();
	}
	public List<ProductVO> listKey(int start){
		return productDao.listKey(start);
	}
	public List<ProductVO> listKeyPop(int start){
		return productDao.listKeyPop(start);
	}
	public List<ProductVO> listKeyOld(int start){
		return productDao.listKeyOld(start);
	}
	
	public int cntCase() {
		return productDao.cntCase();
	}
	public List<ProductVO> listCase(int start){
		return productDao.listCase(start);
	}
	public List<ProductVO> listCasePop(int start){
		return productDao.listCasePop(start);
	}
	public List<ProductVO> listCaseOld(int start){
		return productDao.listCaseOld(start);
	}
	
	
	public ProductVO select(int proNum) {
		return productDao.select(proNum);
	}
	public int selectMaxNum(String proName) {
		return productDao.selectMaxNum(proName);
	}
	
	public void insert(ProductVO productVO) {
		productDao.insert(productVO);
	}
	
	public void update(ProductVO productVO) {
		productDao.update(productVO);
	}
	public void priceChange(ProductVO productVO, int proNum) {
		productDao.priceChange(productVO, proNum);
	}
	public void changeProNum(Map<String, Integer>map) {
		productDao.changeProNum(map);
	}
	
	public void delete(int proNum) {
		productDao.delete(proNum);
	}
	
}
