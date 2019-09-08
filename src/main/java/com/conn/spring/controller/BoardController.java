package com.conn.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conn.spring.VO.BoardVO;
import com.conn.spring.service.BoardService;
import com.conn.spring.service.FileUploadService;
import com.conn.spring.service.PagingService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private FileUploadService fileUploadService;
	
	
	//후기
	@RequestMapping(value="/board/listRe")
	public String listRe(Model model,
			@RequestParam(defaultValue="0")int proNum,
			@RequestParam(defaultValue="1") int curPage) {
		int cnt = boardService.cntRe();
		
		if(proNum != 0) cnt = boardService.cntProRe(proNum);

		PagingService paging = new PagingService(cnt, curPage);
		
		int start = paging.getStartIndex();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("proNum", proNum);
		
		List<BoardVO> board = boardService.listRe(start);
		
		if(proNum != 0) board = boardService.listProRe(map);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("pagination", paging);
		model.addAttribute("proNum", proNum);
		model.addAttribute("list", board);
		return "/board/listRe";
	}
	
	@RequestMapping(value="/board/writeRe", method=RequestMethod.GET)
	public String writeRe(Model model, int proNum,
			@RequestParam(defaultValue = "0") int boRef) {
		model.addAttribute("proNum", proNum);
		model.addAttribute("boRef", boRef);
		return "/board/writeRe";
	}
	
	@RequestMapping(value="/board/writeRe", method=RequestMethod.POST)
	public String writeRe(Model model, BoardVO boardVO, 
			MultipartFile file) {
		if(boardVO.getBoRef() != 0) {
			boardVO.setBoStep(1);
			boardVO.setBoId("관리자");
			boardVO.setBoImg("");
			boardService.writeRe(boardVO);
			return "redirect:/product/read/"+boardVO.getProNum();
		}
		
		String url = fileUploadService.restore(file);
		
		boardVO.setBoImg(url);
		
		boardService.write(boardVO);
		
		return "redirect:/product/read/"+boardVO.getProNum();
		
	}
	
	@RequestMapping(value="/board/modifyRe", method=RequestMethod.GET)
	public String modifyRe(Model model, int boNum) {
		model.addAttribute("boardVO", boardService.read(boNum));
		return "/board/modifyRe";
	}
	
	@RequestMapping(value="/board/modifyRe", method=RequestMethod.POST)
	public String modifyRe(Model model, BoardVO boardVO, String pass,
			MultipartFile file) {
		
		BoardVO origin = boardService.read(boardVO.getBoNum());
		if(!origin.getBoPw().equals(pass)) {
			return "redirect:/board/modifyRe?boNum="+boardVO.getBoNum();
		}
		
		String url = fileUploadService.restore(file);
		
		boardVO.setBoImg(url);
		
		boardService.edit(boardVO);
		
		return "redirect:/product/read/"+origin.getProNum();
	}
	
	//문의
	@RequestMapping(value="/board/listQu")
	public String listQu(Model model,
			@RequestParam(defaultValue="0")int proNum,
			@RequestParam(defaultValue="1") int curPage) {
		int cnt = boardService.cntQu();
		
		if(proNum != 0) cnt = boardService.cntProQu(proNum);

		PagingService paging = new PagingService(cnt, curPage);
		
		int start = paging.getStartIndex();
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("proNum", proNum);
		
		List<BoardVO> board = boardService.listQu(start);
		
		if(proNum != 0) board = boardService.listProQu(map);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("pagination", paging);
		model.addAttribute("proNum", proNum);
		model.addAttribute("list", board);
		return "/board/listQu";
	}
	
	@RequestMapping(value="/board/writeQu", method=RequestMethod.GET)
	public String writeQu(Model model, int proNum,
			@RequestParam(defaultValue = "0") int boRef) {
		model.addAttribute("proNum", proNum);
		model.addAttribute("boRef", boRef);
		return "/board/writeQu";
	}
	
	@RequestMapping(value="/board/writeQu", method=RequestMethod.POST)
	public String writeQu(Model model, BoardVO boardVO, HttpSession session) {
		if(boardVO.getBoRef() != 0) {
			boardVO.setBoStep(1);
			boardVO.setBoId("관리자");
			boardVO.setBoImg("");
			boardService.writeRe(boardVO);
			return "redirect:/product/read/"+boardVO.getProNum();
		}
		
		boardVO.setBoImg("");
		
		boardService.write(boardVO);
		
		return "redirect:/product/read/"+boardVO.getProNum();
	}
	
	@RequestMapping(value="/board/modifyQu", method=RequestMethod.GET)
	public String modifyQu(Model model, int boNum) {
		model.addAttribute("boardVO", boardService.read(boNum));
		return "/board/modifyQu";
	}
	
	@RequestMapping(value="/board/modifyQu", method=RequestMethod.POST)
	public String modifyQu(Model model, BoardVO boardVO, String pass) {
		
		BoardVO origin = boardService.read(boardVO.getBoNum());
		if(!origin.getBoPw().equals(pass)) {
			return "redirect:/board/modifyQu?boNum="+boardVO.getBoNum();
		}
		
		boardService.edit(boardVO);
		
		return "redirect:/product/read/"+origin.getProNum();
	}
}
