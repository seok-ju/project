package com.conn.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.conn.spring.VO. HostBoardVo;
import com.conn.spring.service.HostBoardService;
import com.conn.spring.service.Pagination;

@Controller
public class HostBoardController {
	@Autowired
	private HostBoardService hostBoardService;
	
	@RequestMapping(value="/hostboard/faq")
	public String faq(@RequestParam(defaultValue="1") int curPage, Model model) {
		int listCnt = hostBoardService.listCntFAQ();
		Pagination pagination = new Pagination(listCnt, curPage);
		model.addAttribute("hostBoardList", hostBoardService.listFAQ(pagination.getStartIndex()));
		model.addAttribute("pagination", pagination);
		return "/hostboard/faq";
	}
	
	@RequestMapping(value="/hostboard/notice")
	public String notice(@RequestParam(defaultValue="1") int curPage, Model model) {
		int listCnt = hostBoardService.listCntNO();
		Pagination pagination = new Pagination(listCnt, curPage);
		model.addAttribute("hostBoardList", hostBoardService.listNO(pagination.getStartIndex()));
		model.addAttribute("pagination", pagination);
		return "/hostboard/notice";
	}
	
	@RequestMapping(value="/hostboard/content")
	public String content(Model model, int honum) {
		model.addAttribute("hostBoardList", hostBoardService.content(honum));
		return "/hostboard/content";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/hostboard/write")
	public String move(String hoclass, Model model) {
		model.addAttribute("hoclass", hoclass);
		return "/hostboard/write";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/hostboard/write")
	public String insert(Model model, HostBoardVo vo) {
		hostBoardService.insert(vo);
		return "redirect:/hostboard/notice";
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/hostboard/modify")
	public String updateForm(Model model, int honum) {
		model.addAttribute("hostBoardList", hostBoardService.content(honum));
		return "/hostboard/modify";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/hostboard/modify")
	public String update(Model model, HostBoardVo vo) {
		hostBoardService.update(vo);
		return "redirect:/hostboard/notice";
	}
	
	@RequestMapping(value="/hostboard/delete")
	public String delete(Model model, int honum) {
		hostBoardService.delete(honum);
		return "redirect:/hostboard/notice";
	}
}