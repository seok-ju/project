package com.conn.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.conn.spring.VO.ProductVO;
import com.conn.spring.service.FileUploadService;
import com.conn.spring.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping(value="/product/main")
	public String list(Model model,
			@RequestParam(value="sort", defaultValue="1", required=false) int sort,
			@RequestParam(value="code", defaultValue="1", required=false) int code) {
		
		List<ProductVO> allList = null;
		
		switch(code) {
		case 1:
			allList = productService.list();
			if(sort == 2) allList = productService.listPop();
			else if(sort == 3) allList = productService.listOld();
			break;
		case 2:
			allList = productService.listKey();
			if(sort == 2) allList = productService.listKeyPop();
			else if(sort == 3) allList = productService.listKeyOld();
			break;
		case 3:
			allList = productService.listCase();
			if(sort == 2) allList = productService.listCasePop();
			else if(sort == 3) allList = productService.listCaseOld();
			break;
		}
		
		int Cnt = productService.cnt();
		
		model.addAttribute("sort", sort);
		model.addAttribute("code", code);
		model.addAttribute("Cnt", Cnt);
		model.addAttribute("allList", allList);
		return "/product/main";
	}
	
	@RequestMapping(value="/product/read/{proNum}")
	public String read(Model model, @PathVariable int proNum) {
		ProductVO productVO = productService.select(proNum);
		String[] img = productVO.getProImg2().split("\\+");
		model.addAttribute("img", img);
		model.addAttribute("productVO", productVO);
		return "/product/read";
	}
	
	@RequestMapping(value="/product/write", method=RequestMethod.GET)
	public String write() {
		return "/product/write";
	}
	
	@RequestMapping(value="/product/write", method=RequestMethod.POST)
	public String write(
			Model model,
			ProductVO productVO,
			@RequestParam(value="file1") MultipartFile file1,
			@RequestParam(value="file2") List<MultipartFile> file2) {
		
		String url = fileUploadService.restore(file1);
		
		productVO.setProImg(url);
		
		for(MultipartFile f : file2) {
			url += "+" + fileUploadService.restore(f);
		}
		
		productVO.setProImg2(url);
		
		productService.insert(productVO);
				
		return "redirect:/product/main";
	}
	
	
}
