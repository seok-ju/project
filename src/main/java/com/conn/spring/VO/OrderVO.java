package com.conn.spring.VO;

import org.apache.ibatis.type.Alias;

@Alias("OrderVO")
public class OrderVO {
	private int proNum;
	private String proName;
	private int proPrice;
	private String proContent;
	private String proImg;
	private String proTitle;
	private int proStock;
	private String proSell;
	private int flag;
	private String proClass;
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
	public String getProSell() {
		return proSell;
	}
	public void setProSell(String proSell) {
		this.proSell = proSell;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getProClass() {
		return proClass;
	}
	public void setProClass(String proClass) {
		this.proClass = proClass;
	}
	
	
}
