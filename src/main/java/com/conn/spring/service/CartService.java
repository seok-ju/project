package com.conn.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.CartDao;
import com.conn.spring.VO.CartVO;

@Service
public class CartService {
	
	@Autowired
	private CartDao cartDao;
	
	public CartVO select(int num) {
		return cartDao.select(num);
	}
	
	public void insert(CartVO cartVO) {
		cartDao.insert(cartVO);
	}
	
	public void update(CartVO cartVO) {
		cartDao.update(cartVO);
	}
	
	public void delete(int num) {
		cartDao.delete(num);
	}
}
