package com.conn.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.BoardDao;
import com.conn.spring.VO.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	public int cntRe() {
		return boardDao.cntRe();
	}
	public List<BoardVO> listRe(int start){
		return boardDao.listRe(start);
	}
	public int cntProRe(int proNum) {
		return boardDao.cntProRe(proNum);
	}
	public List<BoardVO> listProRe(Map<String, Integer> map){
		return boardDao.listProRe(map);
	}
	
	public int cntQu() {
		return boardDao.cntQu();
	}
	public List<BoardVO> listQu(int start){
		return boardDao.listQu(start);
	}
	public int cntProQu(int proNum) {
		return boardDao.cntProQu(proNum);
	}
	public List<BoardVO> listProQu(Map<String, Integer> map){
		return boardDao.listProQu(map);
	}
	
	public BoardVO read(int boNum) {
		return boardDao.read(boNum);
	}
	
	public void write(BoardVO boardVO) {
		boardDao.write(boardVO);
	}
	public void writeRe(BoardVO boardVO) {
		boardDao.writeRe(boardVO);
	}
	
	public void edit(BoardVO boardVO) {
		boardDao.edit(boardVO);
	}
	
	public void delete(BoardVO boardVO) {
		boardDao.delete(boardVO);
	}
}
