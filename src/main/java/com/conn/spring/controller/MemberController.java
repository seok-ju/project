package com.conn.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.conn.spring.VO.MemberVO;
import com.conn.spring.service.MemberInfoService;
import com.conn.spring.service.MemberSignService;
import com.conn.spring.service.SecurityUtilService;

@Controller
@SessionAttributes("user")
public class MemberController {
	@Autowired
    private MemberSignService memberSignService;
   @Autowired
   private MemberInfoService memberInfoService;
   @Autowired
   private BCryptPasswordEncoder pwEncoder;
   @Autowired
   private SecurityUtilService sqs;
   
    //SignUp
    @RequestMapping(value="/member/sign/signUp", method=RequestMethod.GET)
    public String signupGET() {
        return "member/sign/signUp";
    }
    @RequestMapping(value="/member/sign/signUp", method=RequestMethod.POST)
    public String signupPOST(HttpServletRequest req, RedirectAttributes rttr) throws Exception {
       String id = req.getParameter("id");
       String pw = sqs.encryptSHA256(req.getParameter("pw1"));
       String pwSecurity = pwEncoder.encode(pw);
       String name = req.getParameter("name");
       String addr = req.getParameter("addr_0") + "+" + req.getParameter("addr_1") + "+" + req.getParameter("addr_2");
       String phone = req.getParameter("phone");
       String email = req.getParameter("email_1") + "@" + req.getParameter("email_2");
       
       MemberVO memberVO = new MemberVO(id, pwSecurity, name, addr, phone, email);
       memberSignService.signUp(memberVO);
       rttr.addFlashAttribute("msg" , "媛��엯�떆 �궗�슜�븳 �씠硫붿씪濡� �씤利앺빐二쇱꽭�슂");
        return "member/sign/signUpComplet";
    }
    
    //�씠硫붿씪 �씤利� 肄붾뱶 寃�利�
    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(MemberVO user,Model model,RedirectAttributes rttr) throws Exception { 
        
        MemberVO vo = new MemberVO();
        vo = memberSignService.userAuth(user);
        if(vo == null) {
            rttr.addFlashAttribute("msg" , "鍮꾩젙�긽�쟻�씤 �젒洹� �엯�땲�떎. �떎�떆 �씤利앺빐 二쇱꽭�슂");
            return "redirect:/index";
        }
        model.addAttribute("login",vo);
        return "redirect:/member/sign/signIn";
    }
    
    // �븘�씠�뵒 以묐났泥댄겕
    @RequestMapping(value = "/idCheck")
    @ResponseBody
    public int idcheck(@RequestParam("id") String id) {
        return memberSignService.idcheck(id);
    }    
    
    
    // 濡쒓렇�씤
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
       if (memberVO != null)   {
    	   model.addAttribute("user", memberVO);
    	   return "member/sign/signInComplet";
       }
       else               return "member/sign/signInFail";
    }
    @RequestMapping(value="/member/sign/signInMyPage", method=RequestMethod.POST)
    public String signInMyPagePOST(Model model,
          @RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw) {
       MemberVO memberVO = signIn(id, pw);
       model.addAttribute("user", memberVO);       
       if (memberVO != null)   return "member/sign/signInComplet";
       else               return "member/sign/signInFail";
    }
    private MemberVO signIn(String id, String pw) {
       int cnt = memberSignService.idcheck(id);
      if(cnt != 0) {
         MemberVO memberVO = memberSignService.Info(id);
         if(memberVO == null) return null;
         String pwSecurity = sqs.encryptSHA256(pw);
         boolean pwMatch = pwEncoder.matches(pwSecurity, memberVO.getPw());
         if (pwMatch)     return memberVO;
         else         return null;
      }
      else   return null;
   }
        
    public void signOut(Model model) {
       model = null;
    }

    // �쉶�썝�젙蹂�
    @RequestMapping("/member/list")
    public String memberList(Model model){
    // controller => service => dao �슂泥�
        List<MemberVO> list = memberInfoService.memberInfoList();
        model.addAttribute("list", list);
        return "member/list";
    }
    @RequestMapping("member/view")
    public String memberView(String id, Model model){
        // �쉶�썝 �젙蹂대�� model�뿉 ���옣
       model.addAttribute("userVo", memberInfoService.Info(id));
        return "member/view";
    }
    
    // �쉶�썝�궘�젣
}
