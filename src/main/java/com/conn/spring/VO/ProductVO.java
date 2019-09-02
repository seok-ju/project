package com.conn.spring.VO;

import org.apache.ibatis.type.Alias;

@Alias("ProductVO")
public class ProductVO {
	private int proNum;
	private String proName;
	private int proPrice;
	private String proViewPrice;
	private String proContent;
	private String proImg;
	private String proImg2;
	private String proTitle;
	private int proStock;
	private int proSell;
	private int flag;
	private String proDiv;
	
	public String getProViewPrice() {
		return proViewPrice;
	}
	public void setProViewPrice(String proViewPrice) {
		this.proViewPrice = proViewPrice;
	}
	public String getProImg2() {
		return proImg2;
	}
	public void setProImg2(String proImg2) {
		this.proImg2 = proImg2;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	public int getProStock() {
		return proStock;
	}
	public void setProStock(int proStock) {
		this.proStock = proStock;
	}
	public int getProSell() {
		return proSell;
	}
	public void setProSell(int proSell) {
		this.proSell = proSell;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getProDiv() {
		return proDiv;
	}
	public void setProDiv(String proDiv) {
		this.proDiv = proDiv;
	}
	
	
}
