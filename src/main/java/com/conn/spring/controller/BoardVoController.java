package com.conn.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.conn.spring.service.BoardVoService;


@Controller
public class BoardVoController {
	@Autowired	
	private BoardVoService boardVoService;

		public void setBoardVoService(BoardVoService boardVoService) {
			this.boardVoService = boardVoService;
		}
		
		
		@RequestMapping(value="/board/listme")
		public String list(Model model) {
			model.addAttribute("boardList", boardVoService.list());
				return "/board/listme";
		}
		
		@RequestMapping(value="/board/read/{boNum}")
		public String read(Model model, @PathVariable int boNum) {
			model.addAttribute("boardVO", boardVoService.read(boNum));
			return "/board/read";
		}
		
}
