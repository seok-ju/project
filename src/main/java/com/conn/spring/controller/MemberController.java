package com.conn.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.conn.spring.VO.MemberVO;
import com.conn.spring.service.MemberSignService;

@Controller
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
    	String addr = req.getParameter("addr_1") + req.getParameter("addr_2");
    	String phone = req.getParameter("phone");
    	String email = req.getParameter("email_1") + "@" + req.getParameter("email_2");
    	
    	MemberVO memberVO = new MemberVO(id, pw, name, addr, phone, email);
    	memberSignService.signUp(memberVO);
        return "member/sign/signUpComplet";
    }
}
