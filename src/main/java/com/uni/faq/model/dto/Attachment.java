package com.uni.faq.model.dto;

import java.sql.Date;

public class Attachment {
	private int fileNo;			// 파일 고유 번호
	private int refFAQNo;		// 참조하고 있는 게시글 번호
	private String originName;	// 파일 원본명
	private String changeName;	// 파일 수정명
	private String filePath;	// 파일이 저장된 폴더 경로
	private Date uploadDate;	// 파일 업로드일
	private int fileLevel;		// 0:타이틀이미지, 1:내용이미지
	private String status;		// 파일 상태값
	
	public Attachment() {
		
	}

	public Attachment(int fileNo, int refFAQNo, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.refFAQNo = refFAQNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}
	
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefFAQNo() {
		return refFAQNo;
	}

	public void setRefFAQNo(int refFAQNo) {
		this.refFAQNo = refFAQNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refFAQNo=" + refFAQNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}
	
	
	
	
	
}
