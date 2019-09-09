package com.conn.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.conn.spring.DAO.MemberDao;
import com.conn.spring.VO.MemberVO;

@Service
public class MemberSignService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private JavaMailSender mailSender;
	
	public MemberDao getMemberDao() {	return memberDao;	}
	public void setMemberDao(MemberDao memberDao) {	this.memberDao = memberDao;	}
	
	// 회원가입
//	public void signUp(MemberVO memberVO) {
//		memberDao.insert(memberVO);
//	}
	
	public void signDown(MemberVO memberVO) {
		memberDao.delete(memberVO);
	}
	
	// 로그인 , 인포
	public MemberVO Info(String id) {
		return memberDao.selectOne(id);
	}
	
	public void signUp(MemberVO vo) throws Exception {
		
		memberDao.insert(vo);
        String key = new TempKeyService().getKey(50,false);  // 인증키 생성

        memberDao.createAuthKey(vo.getEmail(),key); //인증키 db 저장
        //메일 전송
        MailService sendMail = new MailService(mailSender);
        sendMail.setSubject("[meiB 서비스 이용 이메일 인증]");
        sendMail.setText(
                new StringBuffer().append("<h2>메일인증</h2>")
                .append("<a href='http://localhost:8080/spring/emailConfirm?email=")
                .append(vo.getEmail()).append("&mem=")
                .append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("choi87066@gmail.com", "meiB 관리자 ");

        sendMail.setTo(vo.getEmail());
        sendMail.send();
    }

    //이메일 인증 키 검증
    public MemberVO userAuth(MemberVO user) throws Exception {
        MemberVO vo =new MemberVO();
        vo = memberDao.chkAuth(user);
        if(vo!=null){
            try{
                memberDao.userAuth(user);
            }catch (Exception e) {
                e.printStackTrace();
            }}
        return vo;
    }
    
	public int idcheck(String id) {
		int cnt = memberDao.idcheck(id);
		return cnt;
	}
	
}

