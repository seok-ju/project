package com.conn.spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conn.spring.VO.BoardVO;
import com.conn.spring.service.BoardVoService;
import com.conn.spring.service.BoardVoService.FileUploadService;


@Controller
public class BoardVoController {
	@Autowired	
	private BoardVoService boardVoService;
	@Autowired
	private FileUploadService fileUploadService;

		public void setBoardVoService(BoardVoService boardVoService) {
			this.boardVoService = boardVoService;
		}
		
		@RequestMapping(value="/board/listme")
		public String list2(Model model) {
			model.addAttribute("boardList", boardVoService.listme());
			return "/board/listme";
		}
		
		
		
		
		@RequestMapping(value="/board/listhg")
		public String list(Model model) {
			model.addAttribute("boardList", boardVoService.list());
				return "/board/listhg";
		}
		
		@RequestMapping(value="/board/writehg", method=RequestMethod.GET)
		public String write(Model model,
				@RequestParam(value="boDiv") String boDiv) {
			model.addAttribute("boardVO", new BoardVO());
			model.addAttribute("boDiv", boDiv);
			return "/board/writehg";
		}
		
		@RequestMapping(value="/board/writeme", method=RequestMethod.GET)
		public String writeme(Model model,
				@RequestParam(value="boDiv") String boDiv) {
			model.addAttribute("boardVO", new BoardVO());
			model.addAttribute("boDiv", boDiv);
			return "/board/writeme";
		}
		
		@RequestMapping(value="/board/writehg", method=RequestMethod.POST)
		public String write(BoardVO boardVO,
				@RequestParam(value="file1" ) MultipartFile file,
				@RequestParam(value="boDiv") String boDiv){		

		
			
			
			String url = fileUploadService.restore(file);
			System.out.println(url);
			
			boardVO.setBoImg(url);
			boardVO.setBoDiv(boDiv);
			
			boardVoService.write(boardVO);
			
			return "redirect:/board/listhg";
		}
		
		@RequestMapping(value="/board/writeme", method=RequestMethod.POST)
		public String writeme(BoardVO boardVO,
				@RequestParam(value="boDiv") String boDiv){		
			boardVO.setBoDiv(boDiv);
			boardVoService.writeme(boardVO);
			return "redirect:/board/listme";
		}
		
		@RequestMapping(value="/board/writehgRe/{boNum}", method=RequestMethod.GET)
		public String writehgRe(Model model,@PathVariable int boNum) {
			model.addAttribute("boNum", boNum);
			return "/board/writehgRe";
		}
		
		@RequestMapping(value="/board/writehgRe/{boNum}", method=RequestMethod.POST)
		public String writehgRe(BoardVO boardVO,@PathVariable int boNum) {
			
			boardVoService.updateRef(boNum);
			boardVO.setBoRef(boNum);
			boardVO.setBoImg("");
			boardVoService.write(boardVO);
			boardVoService.updateRE(boardVO);
			
			return "redirect:/board/listhg";
		}
		
		@RequestMapping(value="/board/delete/{boNum}", method=RequestMethod.GET)
		public String delete(@PathVariable int boNum, Model model) {
			model.addAttribute("boNum", boNum);
			return "/board/delete";
		}
		
		@RequestMapping(value="/board/delete", method=RequestMethod.POST)
		public String delete(int boNum, String boPw, Model model) {
			int rowCount;
			BoardVO boardVO = new BoardVO();
			boardVO.setBoNum(boNum);
			boardVO.setBoPw(boPw);
			
			rowCount = boardVoService.delete(boardVO);
			
			if(rowCount == 0) {
				model.addAttribute("boNum", boNum);
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
				return "/board/delete";
			}
			else {
					return "redirect:/board/listhg";
			}
		}
		

		
		@RequestMapping(value="/board/edit/{boNum}", method=RequestMethod.GET)
		public String edit(@PathVariable int boNum, Model model) {
			BoardVO boardVO = new BoardVO();
			model.addAttribute("board", boardVoService.select(boNum));
			
			return "/board/edit";
		}
		
		@RequestMapping(value="/board/edit/{boNum}", method=RequestMethod.POST)
		public String edit(
				@Valid BoardVO boardVO,
				@RequestParam(value="file1") MultipartFile file,
				BindingResult result,
				String check,
				@PathVariable(value="boNum") int boNum,
				Model model) {
			String url = fileUploadService.restore(file);
			
			System.out.println(url);
			
			boardVO.setBoImg(url);
			boardVO.setBoNum(boNum);
			
		BoardVO vs = boardVoService.select(boNum);
			
				if(result.hasErrors()) {
					return "/board/edit";
				}
				else {
					if(vs.getBoPw().equals(check)) {
						boardVoService.edit(boardVO);
						return "redirect:/board/listhg";
					}
				}
				model.addAttribute("board", vs);
				model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
				return "/board/edit";
		}
		
		

		


		
}
