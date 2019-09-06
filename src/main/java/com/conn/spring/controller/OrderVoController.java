package com.conn.spring.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conn.spring.VO.MemberVO;
import com.conn.spring.VO.OrderVO;
import com.conn.spring.service.OrderVoService;
import com.conn.spring.service.OrderVoService.FileUploadService;


@Controller
public class OrderVoController {
	@Autowired	//productService 교체
	private OrderVoService orderVoService;
	@Autowired
	private FileUploadService fileUploadService;

		public void setOrderVoService(OrderVoService orderVoService) {
			this.orderVoService = orderVoService;
		}
		
		@RequestMapping(value="/board/order")
		   public String cart(Model model,
		         @CookieValue(value="cart", required=false)Cookie cookie, HttpSession session) {
			
			MemberVO vo = (MemberVO)session.getAttribute("user");
  
			
		      List<OrderVO> list = new ArrayList<OrderVO>();
		      
		      int price = 0;
		      if(cookie != null) {
		         String[]  order = cookie.getValue().split("\\+");
		         for(int i=0; i< order.length; i++) {
		        	 OrderVO orderVO = orderVoService.select(Integer.parseInt( order[i]));
		            price += orderVO.getProPrice();
		            list.add(orderVO);
		         }
		      }
		      
		      
		      String viewPrice = NumberFormat.getInstance().format(price);
		      model.addAttribute("p", price);
		      model.addAttribute("price", viewPrice);
		      model.addAttribute("cnt", list.size());
		      model.addAttribute("cartList", list);
		      
		      if(vo!=null) {
		    	  String[]  member = vo.getAddr().split("\\+");
		    	  model.addAttribute("addr1", member[0]);
		    	  model.addAttribute("addr2", member[1]);
		    	  List<MemberVO> memlist = new ArrayList<MemberVO>();
		    	  memlist.add(vo);
		    	  model.addAttribute("member", vo);
		      }
		      
		      
		      return "/board/order";
		   }

		
		
		
		
		//		@RequestMapping(value="/board/order")
//		public String list(Model model) {
//			model.addAttribute("orderList", orderVoService.list());
//				
//			return "/board/order";
//		}
		
		  @RequestMapping(value="/board/pay/{proNum}")
		   public String cartNoMem(Model model, 
		         @CookieValue(value="cart", required=false)Cookie cookie,
		         HttpServletResponse response,
		         @PathVariable String proNum) {

		      if(cookie != null) proNum += "7+12";
		      
		      Cookie cartCookie = new Cookie("cart", proNum);
		      cartCookie.setPath("/");
		      cartCookie.setMaxAge(60*60*24);
		      
		      response.addCookie(cartCookie);
		      
		      return "redirect:/board/order";
		   }

}
