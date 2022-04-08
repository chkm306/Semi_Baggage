package com.uni.board.model.dto;

import java.sql.Date;

public class Board {
	private int bNo;
	private String bTitle;
	private String bCategory;
	private String bContent;
	private String bDate;
	private int bCount;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int bNo, String bTitle, String bCategory, String bContent, String bDate, int bCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bCategory = bCategory;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bCount = bCount;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbDate() {
		return bDate;
	}

	public void setbDate(String bDate) {
		this.bDate = bDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bCategory=" + bCategory + ", bContent=" + bContent
				+ ", bDate=" + bDate + ", bCount=" + bCount + "]";
	}

	
	
	
}
