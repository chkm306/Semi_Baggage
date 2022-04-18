package com.uni.faq.model.dto;

import java.sql.Date;

public class Answer {
	private int ansNo;
	private String ansContent;
	private int refFAQno;
	private String ansWriter;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Answer() {
	}

	public Answer(int ansNo, String ansContent, int refFAQno, String ansWriter, Date createDate, Date modifyDate,
			String status) {
		super();
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.refFAQno = refFAQno;
		this.ansWriter = ansWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Answer(int ansNo, String ansContent, String ansWriter, Date createDate) {
		super();
		this.ansNo = ansNo;
		this.ansContent = ansContent;
		this.ansWriter = ansWriter;
		this.createDate = createDate;
	}

	public int getAnsNo() {
		return ansNo;
	}

	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public int getRefFAQno() {
		return refFAQno;
	}

	public void setRefFAQno(int refFAQno) {
		this.refFAQno = refFAQno;
	}

	public String getAnsWriter() {
		return ansWriter;
	}

	public void setAnsWriter(String ansWriter) {
		this.ansWriter = ansWriter;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Answer [ansNo=" + ansNo + ", ansContent=" + ansContent + ", refFAQno=" + refFAQno + ", ansWriter="
				+ ansWriter + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}	
}
