package com.conn.spring.controller;

import java.text.NumberFormat;
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
import com.conn.spring.service.PagingService;
import com.conn.spring.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping(value="/product/main")
	public String list(Model model,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="1") int sort,
			@RequestParam(defaultValue="1") int code) {
		
		int Cnt = 0;
		switch(code) {
		case 1:
			Cnt = productService.cnt();
			break;
		case 2:
			Cnt = productService.cntKey();
			break;
		case 3:
			Cnt = productService.cntCase();
		}
		
		PagingService pagingService = new PagingService(Cnt, curPage);
		
		List<ProductVO> allList = null;
		
		int start = pagingService.getStartIndex();
		
		switch(code) {
		case 1:
			allList = productService.list(start);
			if(sort == 2) allList = productService.listPop(start);
			else if(sort == 3) allList = productService.listOld(start);
			break;
		case 2:
			allList = productService.listKey(start);
			if(sort == 2) allList = productService.listKeyPop(start);
			else if(sort == 3) allList = productService.listKeyOld(start);
			break;
		case 3:
			allList = productService.listCase(start);
			if(sort == 2) allList = productService.listCasePop(start);
			else if(sort == 3) allList = productService.listCaseOld(start);
			break;
		}
		
		model.addAttribute("pagination", pagingService);
		model.addAttribute("sort", sort);
		model.addAttribute("code", code);
		model.addAttribute("Cnt", Cnt);
		model.addAttribute("allList", allList);
		return "/product/main";
	}
	
	@RequestMapping(value="/product/main/search", method=RequestMethod.POST)
	public String mainSearch(
			Model model,
			@RequestParam(value="search") String proName) {
		
		model.addAttribute("allList", productService.search(proName));
		model.addAttribute("Cnt", productService.searchCnt(proName));
		model.addAttribute("search", proName);
		return "/product/mainSearch";		
	}
	
	@RequestMapping(value="/product/read/{proNum}")
	public String read(Model model, @PathVariable int proNum) {
		ProductVO productVO = productService.select(proNum);
		int point = productVO.getProPrice()/100;
		String[] img = productVO.getProImg2().split("\\+");
		model.addAttribute("img", img);
		model.addAttribute("point", point);
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
		
		String proViewPrice = NumberFormat.getInstance().format(productVO.getProPrice());
		productVO.setProViewPrice(proViewPrice+"원");
		
		productService.insert(productVO);
				
		return "redirect:/product/main";
	}
	
	@RequestMapping(value="/product/modify/{proNum}", method=RequestMethod.GET)
	public String modify(Model model, @PathVariable int proNum) {
		
		model.addAttribute("productVO", productService.select(proNum));
		return "/product/modify";		
	}
	
	@RequestMapping(value="/product/modify/{proNum}", method=RequestMethod.POST)
	public String modify(
			Model model,
			ProductVO productVO,
			@PathVariable int proNum,
			@RequestParam(value="file1") MultipartFile file1,
			@RequestParam(value="file2") List<MultipartFile> file2) {
		
		productVO.setProNum(proNum);
		
		String url = fileUploadService.restore(file1);
		
		productVO.setProImg(url);
		
		for(MultipartFile f : file2) {
			url += "+" + fileUploadService.restore(f);
		}
		
		productVO.setProImg2(url);
		
		productService.update(productVO);
				
		return "redirect:/product/main";
	}
	
	@RequestMapping(value="/product/price/{proNum}", method=RequestMethod.GET)
	public String price(Model model, @PathVariable int proNum) {
		model.addAttribute("proNum", proNum);
		return "/product/price";
	}
	
	@RequestMapping(value="/product/price/{proNum}", method=RequestMethod.POST)
	public String price(
			@RequestParam(value="price") int price,
			@PathVariable int proNum) {
		
		ProductVO productVO = productService.select(proNum);
		if(productVO.getProContent()==null)productVO.setProContent("");
		
		String proViewPrice = NumberFormat.getInstance().format(price);
		productVO.setProViewPrice(proViewPrice);
		productVO.setProPrice(price);
		
		productService.priceChange(productVO, proNum);
		
		return "redirect:/product/main";
	}
}
