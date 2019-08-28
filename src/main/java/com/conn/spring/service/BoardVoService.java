package com.conn.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.BoardVoDao;
import com.conn.spring.VO.BoardVO;

@Service
public class BoardVoService {
	@Autowired
	private BoardVoDao boardDao;
		
		public BoardVoDao getBoardDao() {
			return boardDao;
		}

		public void setBoardDao(BoardVoDao boardDao) {
			this.boardDao = boardDao;
		}
		
		public List<BoardVO> list(){
			return boardDao.list();
		}
		
		public int delete(BoardVO boardVO) {
				return boardDao.delete(boardVO);
		}
		
		public int edit(BoardVO boardVO) {
				return boardDao.update(boardVO);
		}
		public void write(BoardVO boardVO) {
				boardDao.insert(boardVO);
		}
		public BoardVO read(int BONUM) {
				return boardDao.select(BONUM);
		}

}
