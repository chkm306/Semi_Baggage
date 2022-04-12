package com.uni.member.model.dto;

import java.sql.Date;

public class Member {
	private String userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String email;
	private Date enrollDate;
	private int userType;
	private String phone;
	
	
	public Member() {}
	

	public Member(String userId, String userPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
	}


	public Member(String userNo, String userName, String userId, String userPwd, String email, Date enrollDate,
			int userType, String phone) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.enrollDate = enrollDate;
		this.userType = userType;
		this.phone = phone;
	}
	
	public Member(String userName, String userId, String userPwd, String email, 
			int userType, String phone) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.userType = userType;
		this.phone = phone;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public int getUserType() {
		return userType;
	}


	public void setUserType(int userType) {
		this.userType = userType;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", email=" + email + ", enrollDate=" + enrollDate + ", userType=" + userType + ", phone=" + phone
				+ "]";
	}
	
	
}
