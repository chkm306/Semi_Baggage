package com.uni.board.model.dto;

import java.sql.Date;

public class Board { 
	private int bNo; 
	private String bTitle;
	private Date bDate;
	private int bCount;
	private String bContent;

	 
	public Board() {
		// TODO Auto-generated constructor stub
	}
 

	public Board(int bNo, String bTitle, Date bDate, int bCount, String bContent) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bCount = bCount;
		this.bContent = bContent;
	}


	public Board(int bNo) {
		super();
		this.bNo = bNo;	
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


	public Date getbDate() {
		return bDate;
	}


	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}


	public int getbCount() {
		return bCount;
	}


	public void setbCount(int bCount) {
		this.bCount = bCount;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bDate=" + bDate + ", bCount=" + bCount + ", bContent="
				+ bContent + "]";
	}

	
}
