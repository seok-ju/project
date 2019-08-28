package com.conn.spring.VO;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Alias("BoardVO")
public class BoardVO {
		
		private int boNum; //게시글번호 (PK)
		
		private int proNum;	//PRODUCT(FK)
		
		private int num;	//MEMBER(FK)
		
		private String boId;	//아이디
		@Length(min=2, max=10, message="제목 2자이상입력, 10자 미만 입력 하셔야 합니다.")
		private String boTitle;	//제목
		@NotEmpty(message="내용을 입력하세요.")
		private String boContent; //내용
		
		private String boPw;	//비밀번호
		
		private String boDiv;	//분류 // (hg)(me)
		
		private String boImg;	//이미지
		
		private Timestamp boDate;	//날짜

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

		public Timestamp getBoDate() {
			return boDate;
		}

		public void setBoDate(Timestamp boDate) {
			this.boDate = boDate;
		}		
}
