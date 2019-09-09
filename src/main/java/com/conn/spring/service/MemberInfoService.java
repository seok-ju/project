package com.conn.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.MemberDao;
import com.conn.spring.VO.MemberVO;

@Service
public class MemberInfoService {
	@Autowired
	private MemberDao memberDao;

	public MemberDao getMemberDao() {	return memberDao;	}
	public void setMemberDao(MemberDao memberDao) {	this.memberDao = memberDao;	}
	
	public List<MemberVO> memberInfoList() {
		return memberDao.selectAll();
	}
	// 로그인 , 인포
	public MemberVO Info(String id) {
		return memberDao.selectOne(id);
	}
}

