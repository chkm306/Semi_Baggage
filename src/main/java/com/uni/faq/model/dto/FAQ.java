package com.uni.faq.model.dto;

import java.sql.Date;

public class FAQ {
	
	private int faqNo;
	private String faqCategory;
	private String faqTitle;
	private String faqContent;
	private String memNo;
	private Date faqDate;
	private String status;
	
	public FAQ() {
	}

	public FAQ(int faqNo, String faqCategory, String faqTitle, String faqContent, String memNo, Date faqDate,
			String status) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.memNo = memNo;
		this.faqDate = faqDate;
		this.status = status;
	}

	public FAQ(int faqNo, String faqCategory, String faqTitle, String memNo, Date faqDate) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.memNo = memNo;
		this.faqDate = faqDate;
	}

	public FAQ(int faqNo, String faqCategory, String faqTitle, String memNo, Date faqDate, String status) {
		super();
		this.faqNo = faqNo;
		this.faqCategory = faqCategory;
		this.faqTitle = faqTitle;
		this.memNo = memNo;
		this.faqDate = faqDate;
		this.status = status;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqCategory() {
		return faqCategory;
	}

	public void setFaqCategory(String faqCategory) {
		this.faqCategory = faqCategory;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqCategory=" + faqCategory + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", memNo=" + memNo + ", faqDate=" + faqDate + ", status=" + status + "]";
	}
	
	

}
