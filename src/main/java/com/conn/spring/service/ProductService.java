package com.conn.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.ProductDao;
import com.conn.spring.VO.ProductVO;

@Service
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public int cnt() {
		return productDao.cnt();
	}
	public List<ProductVO> list(){
		return productDao.list();
	}
	public List<ProductVO> listPop(){
		return productDao.listPop();
	}
	public List<ProductVO> listOld(){
		return productDao.listOld();
	}
	
	public int cntKey() {
		return productDao.cntKey();
	}
	public List<ProductVO> listKey(){
		return productDao.listKey();
	}
	public List<ProductVO> listKeyPop(){
		return productDao.listKeyPop();
	}
	public List<ProductVO> listKeyOld(){
		return productDao.listKeyOld();
	}
	
	public int cntCase() {
		return productDao.cntCase();
	}
	public List<ProductVO> listCase(){
		return productDao.listCase();
	}
	public List<ProductVO> listCasePop(){
		return productDao.listCasePop();
	}
	public List<ProductVO> listCaseOld(){
		return productDao.listCaseOld();
	}
	
	
	public ProductVO select(int proNum) {
		return productDao.select(proNum);
	}
	
	public void insert(ProductVO productVO) {
		productDao.insert(productVO);
	}
	
	public void update(ProductVO productVO) {
		productDao.update(productVO);
	}
	
	public void delete(int proNum) {
		productDao.delete(proNum);
	}
	
}
