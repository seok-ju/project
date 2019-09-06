package com.conn.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.HostBoardDao;
import com.conn.spring.VO.HostBoardVo;

@Service
public class HostBoardService {
	@Autowired
	private HostBoardDao hostBoardDao;
	
	public List<HostBoardVo> listFAQ(int startIndex){
		return hostBoardDao.listFAQ(startIndex);
	}
	
	public List<HostBoardVo> listNO(int startIndex){
		return hostBoardDao.listNO(startIndex);
	}
	
	public List<HostBoardVo> content(int honum){
		return hostBoardDao.content(honum);
	}
	
	public int listCntFAQ() {
		return hostBoardDao.listCntFAQ();
	}
	
	public int listCntNO() {
		return hostBoardDao.listCntNO();
	}
	
	public int insert(HostBoardVo vo){
		return hostBoardDao.insert(vo);
	}
	
	public int update(HostBoardVo vo) {
		return hostBoardDao.update(vo);
	}
	
	public int delete(int honum) {
		return hostBoardDao.delete(honum);
	}
}