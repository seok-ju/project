package com.conn.spring.VO;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {
	
	private int boNum;
	private int proNum;
	private int num;
	private int boRef;
	private int boStep;
	private String boId;
	private String boTitle;
	private String boContent;
	private String boPw;
	private String boDiv;
	private String boImg;
	private Date boDate;
	public int getBoNum() {
		return boNum;
	}
	public void setBoNum(int boNum) {
		this.boNum = boNum;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoRef() {
		return boRef;
	}
	public void setBoRef(int boRef) {
		this.boRef = boRef;
	}
	public int getBoStep() {
		return boStep;
	}
	public void setBoStep(int boStep) {
		this.boStep = boStep;
	}
	public String getBoId() {
		return boId;
	}
	public void setBoId(String boId) {
		this.boId = boId;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoPw() {
		return boPw;
	}
	public void setBoPw(String boPw) {
		this.boPw = boPw;
	}
	public String getBoDiv() {
		return boDiv;
	}
	public void setBoDiv(String boDiv) {
		this.boDiv = boDiv;
	}
	public String getBoImg() {
		return boImg;
	}
	public void setBoImg(String boImg) {
		this.boImg = boImg;
	}
	public Date getBoDate() {
		return boDate;
	}
	public void setBoDate(Date boDate) {
		this.boDate = boDate;
	}
}
