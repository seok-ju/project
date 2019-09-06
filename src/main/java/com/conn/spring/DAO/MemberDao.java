package com.conn.spring.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.conn.spring.VO.MemberVO;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int idcheck(String id) {
		return sqlSessionTemplate.selectOne("MemberVO.idcheck", id);
	}
	
	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("MemberVO.signUp", memberVO);
	}
	public void delete(MemberVO memberVO) {
		sqlSessionTemplate.delete("MemberVO.signDown", memberVO);
	}
	public MemberVO selectOne(String id) {
		return sqlSessionTemplate.selectOne("MemberVO.info", id);
	}
	public List<MemberVO> selectAll() {
		return sqlSessionTemplate.selectList("MemberVO.list");
	}
		
	
}
