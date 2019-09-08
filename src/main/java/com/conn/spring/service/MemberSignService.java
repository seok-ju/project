package com.conn.spring.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
	public void signUp(MemberVO memberVO) {
		memberDao.insert(memberVO);
	}
	public void signDown(MemberVO memberVO) {
		memberDao.delete(memberVO);
	}
	
	// 로그인 , 인포
	public MemberVO Info(String id) {
		return memberDao.selectOne(id);
	}
	
	// 메일 인증
//	public ModelAndView emailAuth(String email) {
//		Random rd = new Random();
//		String authNum = "";
//		authNum = Integer.toString((rd.nextInt(99998) + 1));
//		sendEmail(email, authNum);
//		return ;
//	}
	private void sendEmail(String email, String authNum) {
		String host = "smtp.naver.com";
		String user = "ssohirokr@naver.com";
		String password = "Ss5668792";    

		String subject = "meiB 인증번호 전달";
		String fromName = "meiB 관리자";
		String from = "ssohirokr@naver.com";
		String to = email;
		String content = "인증 번호 [ " + authNum + " ]";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		//인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i = 0 ; i < 10 ; i++) {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
		
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("maiB@maib.com"));

			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=UTF-8");
			InternetAddress addr = new InternetAddress(to);
			msg.setRecipient(Message.RecipientType.TO, addr);
			
			Transport.send(msg); // 매일 보내기
			System.out.println("message sent successfully...");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	public int idcheck(String id) {
		int cnt = memberDao.idcheck(id);
		return cnt;
	}
	
}

