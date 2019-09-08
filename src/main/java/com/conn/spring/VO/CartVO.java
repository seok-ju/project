package com.conn.spring.VO;

import org.apache.ibatis.type.Alias;

@Alias("CartVO")
public class CartVO {
	private int num;
	private String cid;
	private String cnum;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	
	
}
