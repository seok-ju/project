package com.conn.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.MemberDao;
import com.conn.spring.VO.MemberVO;

@Service
public class MemberSignService {
	@Autowired
	private MemberDao memberDao;
	
	public MemberDao getMemberDao() {	return memberDao;	}
	public void setMemberDao(MemberDao memberDao) {	this.memberDao = memberDao;	}
	
	// 회원가입
	public void signUp(MemberVO memberVO) {
		memberDao.insert(memberVO);
	}
	public void signDown(MemberVO memberVO) {
		memberDao.delete(memberVO);
	}
	
	
	
	
	
	
	
}

