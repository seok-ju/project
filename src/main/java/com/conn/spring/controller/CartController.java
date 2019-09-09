package com.conn.spring.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.conn.spring.VO.CartVO;
import com.conn.spring.VO.MemberVO;
import com.conn.spring.VO.ProductVO;
import com.conn.spring.service.CartService;
import com.conn.spring.service.ProductService;

@Controller
public class CartController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="/product/cart")
	public String cart(Model model,
			@CookieValue(value="cart", required=false)Cookie cookie,
			HttpSession session) {
		CartVO cartVO = null;
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member != null) cartVO = cartService.select(member.getNum());
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		int price = 0;
		if(cookie != null) {
			String[] product = cookie.getValue().split("\\+");
			for(int i=0; i<product.length; i++) {
				ProductVO productVO = productService.select(Integer.parseInt(product[i]));
				price += productVO.getProPrice();
				list.add(productVO);
			}
		}else if(cartVO != null) {
			String[] product = cartVO.getCnum().split("\\+");
			for(int i=0; i<product.length; i++) {
				ProductVO productVO = productService.select(Integer.parseInt(product[i]));
				price += productVO.getProPrice();
				list.add(productVO);
			}
		}
		
		String viewPrice = NumberFormat.getInstance().format(price);
		model.addAttribute("price", viewPrice);
		model.addAttribute("cnt", list.size());
		model.addAttribute("cartList", list);
		
		return "/product/cart";
	}
	
	@RequestMapping(value="/product/cartMem/{proNum}")
	public String cartMem(
			@PathVariable String proNum,
			HttpSession session) {
		CartVO cartVO = null;
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member != null)cartVO = cartService.select(member.getNum());
		if(cartVO == null) {
			cartVO = new CartVO();
			cartVO.setNum(member.getNum());
			cartVO.setCid(member.getId());
			cartVO.setCnum(proNum);
			cartService.insert(cartVO);
		} else {
			proNum += "+" + cartVO.getCnum();
			cartVO.setCnum(proNum);
			cartService.update(cartVO);
		}
		
		return "redirect:/product/cart";
	}
	
	
	@RequestMapping(value="/product/cartNoMem/{proNum}")
	public String cartNoMem( 
			@CookieValue(value="cart", required=false)Cookie cookie,
			HttpServletResponse response,
			@PathVariable String proNum) {

		if(cookie != null) proNum += "+" + cookie.getValue();
		
		Cookie cartCookie = new Cookie("cart", proNum);
		cartCookie.setPath("/");
		cartCookie.setMaxAge(60*60*24);
		
		response.addCookie(cartCookie);
		
		return "redirect:/product/cart";
	}
	
	@RequestMapping(value="/product/cartDelete")
	public String cartDelete(
			@CookieValue(value="cart", required=false)Cookie cookie,
			HttpServletResponse response,
			HttpSession session
			) {

		MemberVO member = (MemberVO)session.getAttribute("user");
		
		if(cookie != null) {
			cookie = new Cookie("cart", "");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}else if(member != null) {
			cartService.delete(member.getNum());
		}
		
		return "redirect:/product/main";		
	}
	
	@RequestMapping(value="/cart/order")
	public String orderCart(Model model,
			@CookieValue(value="cart", required=false) Cookie cookie,
			HttpSession session) {
		CartVO cartVO = null;
		String[] addr = null;
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member != null) {
			addr = member.getAddr().split("\\+");
			model.addAttribute("member", member);
			model.addAttribute("addr1", addr[0]);
			model.addAttribute("addr2", addr[1]);
			model.addAttribute("addr3", addr[2]);
			cartVO = cartService.select(member.getNum());
		}
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		int price = 0;
		
		if(cookie != null) {
			String[] product = cookie.getValue().split("\\+");
			for(int i=0; i<product.length; i++) {
				ProductVO productVO = productService.select(Integer.parseInt(product[i]));
				price += productVO.getProPrice();
				list.add(productVO);
			}
		}else if(cartVO != null) {
			String[] product = cartVO.getCnum().split("\\+");
			for(int i=0; i<product.length; i++) {
				ProductVO productVO = productService.select(Integer.parseInt(product[i]));
				price += productVO.getProPrice();
				list.add(productVO);
			}
		}
		model.addAttribute("orderList", list);
		model.addAttribute("totalPrice", price);
		
		return "/board/order";
	}
	
}
