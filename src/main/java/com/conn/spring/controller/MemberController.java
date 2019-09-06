package com.conn.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.conn.spring.VO.MemberVO;
import com.conn.spring.service.MemberSignService;

@Controller
@SessionAttributes("user")
public class MemberController {
	@Autowired
    private MemberSignService memberSignService;
	
    //SignUp
    @RequestMapping(value="/member/sign/signUp", method=RequestMethod.GET)
    public String signupGET() {
    	return "member/sign/signUp";
    }
    @RequestMapping(value="/member/sign/signUp", method=RequestMethod.POST)
    public String signupPOST(HttpServletRequest req) {
    	String id = req.getParameter("id");
    	String pw = req.getParameter("pw1");
    	String name = req.getParameter("name");
    	String addr = req.getParameter("addr_0") + "+" + req.getParameter("addr_1") + "+" + req.getParameter("addr_2");
    	String phone = req.getParameter("phone");
    	String email = req.getParameter("email_1") + "@" + req.getParameter("email_2");
    	
    	MemberVO memberVO = new MemberVO(id, pw, name, addr, phone, email);
    	memberSignService.signUp(memberVO);
        return "member/sign/signUpComplet";
    }
    // 아이디 중복체크
    @RequestMapping(value = "/idCheck", method = RequestMethod.GET)
    @ResponseBody
    public int idcheck(@RequestParam("id") String id) {
        return memberSignService.idcheck(id);
    }
    
    // 메일 인증
    @RequestMapping(value = "/emailAuth")
    public String emailAuth(HttpServletRequest req) {
    	String email = req.getParameter("email_1") + "@" + req.getParameter("email_2");
    	memberSignService.emailAuth(email);
    	
    	return "/emailAuth";
    }

    @RequestMapping(value="/member/sign/signIn", method=RequestMethod.GET)
    public String signInGET() {
    	return "member/sign/signIn";
    }
    @RequestMapping(value="/member/sign/signInMyPage", method=RequestMethod.GET)
    public String signInMyPageGET() {
    	return "member/sign/signInMyPage";
    }
    @RequestMapping(value="/member/sign/signIn", method=RequestMethod.POST)
    public String signInPOST(Model model,
    		@RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw) {
    	MemberVO memberVO = signIn(id, pw);
    	model.addAttribute("user", memberVO);    	
    	if (memberVO != null)	return "member/sign/signInComplet";
    	else					return "member/sign/signInFail";
    }
    @RequestMapping(value="/member/sign/signInMyPage", method=RequestMethod.POST)
    public String signInMyPagePOST(Model model,
    		@RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw) {
    	MemberVO memberVO = signIn(id, pw);
    	model.addAttribute("user", memberVO);    	
    	if (memberVO != null)	return "member/sign/signInComplet";
    	else					return "member/sign/signInFail";
    }
    private MemberVO signIn(String id, String pw) {
		MemberVO memberVO = memberSignService.Info(id);
		if (pw.equals(memberVO.getPw()))  	return memberVO;
		else								return null;
	}
        
    
    
    
}
