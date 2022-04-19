package com.uni.notice.model.dto;

import java.sql.Date;

public class Notice { 
	private int bNo; 
	private String bTitle;
	private Date bDate;
	private int bCount;
	private String bContent;

	 
	public Notice() {
		// TODO Auto-generated constructor stub
	}
 

	public Notice(int bNo, String bTitle, Date bDate, int bCount, String bContent) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bDate = bDate;
		this.bCount = bCount;
		this.bContent = bContent;
	}


	public Notice(int bNo) {
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
		return "Notice [bNo=" + bNo + ", bTitle=" + bTitle + ", bDate=" + bDate + ", bCount=" + bCount + ", bContent="
				+ bContent + "]";
	}

	
}
