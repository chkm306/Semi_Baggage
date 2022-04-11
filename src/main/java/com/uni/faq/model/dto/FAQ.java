package com.uni.faq.model.dto;

import java.sql.Date;

public class FAQ {
	
	private int faq_No;
	private int mem_no;
	private String faq_title;
	private String faq_Category;
	private String faq_Content;
	private Date faq_Date;
	private String status;
	
	public FAQ() {
	}

	public FAQ(int faq_No, int mem_no, String faq_title, String faq_Category, String faq_Content, Date faq_Date,
			String status) {
		super();
		this.faq_No = faq_No;
		this.mem_no = mem_no;
		this.faq_title = faq_title;
		this.faq_Category = faq_Category;
		this.faq_Content = faq_Content;
		this.faq_Date = faq_Date;
		this.status = status;
	}

	public int getFaq_No() {
		return faq_No;
	}

	public void setFaq_No(int faq_No) {
		this.faq_No = faq_No;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_Category() {
		return faq_Category;
	}

	public void setFaq_Category(String faq_Category) {
		this.faq_Category = faq_Category;
	}

	public String getFaq_Content() {
		return faq_Content;
	}

	public void setFaq_Content(String faq_Content) {
		this.faq_Content = faq_Content;
	}

	public Date getFaq_Date() {
		return faq_Date;
	}

	public void setFaq_Date(Date faq_Date) {
		this.faq_Date = faq_Date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FAQ [faq_No=" + faq_No + ", mem_no=" + mem_no + ", faq_title=" + faq_title + ", faq_Category="
				+ faq_Category + ", faq_Content=" + faq_Content + ", faq_Date=" + faq_Date + ", status=" + status + "]";
	}
	
	
	
}
