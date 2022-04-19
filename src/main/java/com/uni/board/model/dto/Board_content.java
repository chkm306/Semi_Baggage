package com.uni.board.model.dto;

public class Board_content {

	private int b_No;
	private String b_Contents;
	private int b_Order;
	private String b_Origin;
	private String b_Change;
	private String b_Path;
	private String b_status;
	
	public Board_content() {
		// TODO Auto-generated constructor stub
	}
	
	
	




	public Board_content(int b_No, String b_Contents, int b_Order, String b_Origin, String b_Change, String b_Path,
			String b_status) {
		super();
		this.b_No = b_No;
		this.b_Contents = b_Contents;
		this.b_Order = b_Order;
		this.b_Origin = b_Origin;
		this.b_Change = b_Change;
		this.b_Path = b_Path;
		this.b_status = b_status;
	}

	public Board_content(int b_No, String b_Contents, int b_Order, String b_Origin, String b_Change, String b_Path) {
		super();
		this.b_No = b_No;
		this.b_Contents = b_Contents;
		this.b_Order = b_Order;
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

	public String getB_Contents() {
		return b_Contents;
	}

	public void setB_Contents(String b_Contents) {
		this.b_Contents = b_Contents;
	}

	public int getB_Order() {
		return b_Order;
	}

	public void setB_Order(int b_Order) {
		this.b_Order = b_Order;
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
	

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}


	@Override
	public String toString() {
		return "Board_content [b_No=" + b_No + ", b_Contents=" + b_Contents + ", b_Order=" + b_Order + ", b_Origin="
				+ b_Origin + ", b_Change=" + b_Change + ", b_Path=" + b_Path + "b_status" + b_status + "]";
	}
	
	
	
}


