package com.uni.board.model.dto;

import java.sql.Date;

public class Board_Info {
	private int b_No;
	private String b_Title;
	private int b_Category;
	private Date t_Date;
	private int t_Count;
	private String b_Origin;
	private String b_Change;
	private String b_Path;
	
	private String b_status;
	
	public Board_Info() {
		// TODO Auto-generated constructor stub
	}

	

	public Board_Info(int b_No, String b_Title, int b_Category, Date t_Date, int t_Count, String b_Origin,
			String b_Change, String b_Path, String b_status) {
		super();
		this.b_No = b_No;
		this.b_Title = b_Title;
		this.b_Category = b_Category;
		this.t_Date = t_Date;
		this.t_Count = t_Count;
		this.b_Origin = b_Origin;
		this.b_Change = b_Change;
		this.b_Path = b_Path;
		this.b_status = b_status;
	}



	public Board_Info(int b_No, String b_Title, int b_Category, String b_Origin, String b_Change, String b_Path) {
		super();
		this.b_No = b_No;
		this.b_Title = b_Title;
		this.b_Category = b_Category;
		this.b_Origin = b_Origin;
		this.b_Change = b_Change;
		this.b_Path = b_Path;

		
	}
	
	



	public int getB_No() {
		return b_No;
	}

	public void setB_No(int b_No) {
		this.b_No = b_No;
	}

	public String getB_Title() {
		return b_Title;
	}

	public void setB_Title(String b_Title) {
		this.b_Title = b_Title;
	}

	public int getB_Category() {
		return b_Category;
	}

	public void setB_Category(int b_Category) {
		this.b_Category = b_Category;
	}

	public Date getT_Date() {
		return t_Date;
	}

	public void setT_Date(Date t_Date) {
		this.t_Date = t_Date;
	}

	public int getT_Count() {
		return t_Count;
	}

	public void setT_Count(int t_Count) {
		this.t_Count = t_Count;
	}

	public String getB_Origin() {
		return b_Origin;
	}

	public void setB_Origin(String b_Origin) {
		this.b_Origin = b_Origin;
	}

	public String getB_Change() {
		return b_Change;
	}

	public void setB_Change(String b_Change) {
		this.b_Change = b_Change;
	}

	public String getB_Path() {
		return b_Path;
	}

	public void setB_Path(String b_Path) {
		this.b_Path = b_Path;
	}

	@Override
	public String toString() {
		return "Board_Info [b_No=" + b_No + ", b_Title=" + b_Title + ", b_Category=" + b_Category + ", t_Date=" + t_Date
				+ ", t_Count=" + t_Count + ", b_Origin=" + b_Origin + ", b_Change=" + b_Change + ", b_Path=" + b_Path
				+ "]";
	}
	
	
	
	
	

}
