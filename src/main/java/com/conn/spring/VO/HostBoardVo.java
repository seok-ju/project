package com.conn.spring.VO;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("HostVO")
public class HostBoardVo {
	private int honum;
	private int hoclass;
	private String hotitle;
	private String hocontent;
	private Date hodate;
	
	public int getHonum() {
		return honum;
	}
	public void setHonum(int honum) {
		this.honum = honum;
	}
	public int getHoclass() {
		return hoclass;
	}
	public void setHoclass(int hoclass) {
		this.hoclass = hoclass;
	}
	public String getHotitle() {
		return hotitle;
	}
	public void setHotitle(String hotitle) {
		this.hotitle = hotitle;
	}
	public String getHocontent() {
		return hocontent;
	}
	public void setHocontent(String hocontent) {
		this.hocontent = hocontent;
	}
	public Date getHodate() {
		return hodate;
	}
	public void setHodate(Date hodate) {
		this.hodate = hodate;
	}
}
