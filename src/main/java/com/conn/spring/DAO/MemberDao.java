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
		return sqlSessionTemplate.selectOne("MemberDao.idcheck", id);
	}
	
	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("MemberDao.signUp", memberVO);
	}
	public void delete(MemberVO memberVO) {
		sqlSessionTemplate.delete("MemberDao.signDown", memberVO);
	}
	public MemberVO selectOne(String id) {
		return sqlSessionTemplate.selectOne("MemberDao.info", id);
	}
	public List<MemberVO> selectAll() {
		return sqlSessionTemplate.selectList("MemberDao.list");
	}
	
	 //email 중복 확인
    public MemberVO authenticate(String str) throws Exception {
        return sqlSessionTemplate.selectOne("MemberDao.checkdupl", str);
    }
 
    //해당 email에 인증 키 업데이트
    public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception {
        MemberVO vo = new MemberVO();
        vo.setMem(memberAuthKey);
        vo.setEmail(memberEmail);
        sqlSessionTemplate.update("MemberDao.createAuthKey", vo);
    }
    //이메일 인증 코드 확인
    public MemberVO chkAuth(MemberVO vo) throws Exception {
        return sqlSessionTemplate.selectOne("MemberDao.chkAuth", vo);
    }
    //인증 후 계정 활성화
    public void userAuth(MemberVO vo) throws Exception {
        sqlSessionTemplate.update("MemberDao.userAuth", vo);
    }

		
	
}
