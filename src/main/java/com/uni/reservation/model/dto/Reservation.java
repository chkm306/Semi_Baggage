package com.uni.reservation.model.dto;

public class Reservation {

	private int res_no; //예약번호
	private String mem_no; //회원번호
	private String res_type; //예약종류
	private String baggage; //짐
	private int amount; //수량
	private String sta_date; //출발날짜
	private String sta_place; //출발장소
	private String arr_place; //도착장소
	private String sta_time; //출발시간
	private String arr_time; //도착시간
	private String status; //상태
	
	
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	
	public Reservation(String mem_no, String res_type, String baggage, int amount, String sta_date, String sta_place,
			String arr_place, String sta_time, String arr_time) {
		super();
		this.mem_no = mem_no;
		this.res_type = res_type;
		this.baggage = baggage;
		this.amount = amount;
		this.sta_date = sta_date;
		this.sta_place = sta_place;
		this.arr_place = arr_place;
		this.sta_time = sta_time;
		this.arr_time = arr_time;
	}


	public Reservation(int res_no, String mem_no, String res_type, String baggage, int amount, String sta_date,
			String sta_place, String arr_place, String sta_time, String arr_time, String status) {
		super();
		this.res_no = res_no;
		this.mem_no = mem_no;
		this.res_type = res_type;
		this.baggage = baggage;
		this.amount = amount;
		this.sta_date = sta_date;
		this.sta_place = sta_place;
		this.arr_place = arr_place;
		this.sta_time = sta_time;
		this.arr_time = arr_time;
		this.status = status;
	}






	public Reservation(int res_no, String mem_no, String res_type, String baggage, int amount, String sta_date,
			String sta_place, String arr_place, String sta_time, String arr_time) {
		super();
		this.res_no = res_no;
		this.mem_no = mem_no;
		this.res_type = res_type;
		this.baggage = baggage;
		this.amount = amount;
		this.sta_date = sta_date;
		this.sta_place = sta_place;
		this.arr_place = arr_place;
		this.sta_time = sta_time;
		this.arr_time = arr_time;
	}


	public Reservation(String res_type, String sta_date, String sta_place, String arr_place, String sta_time,
			String arr_time) {
		super();
		this.res_type = res_type;
		this.sta_date = sta_date;
		this.sta_place = sta_place;
		this.arr_place = arr_place;
		this.sta_time = sta_time;
		this.arr_time = arr_time;
	}

	public Reservation(String res_type, String baggage, int amount, String sta_place, String sta_date,
			String sta_time, String arr_place, String arr_time) {
		super();

		this.res_type = res_type;
		this.baggage = baggage;
		this.amount = amount;
		this.sta_place = sta_place;
		this.sta_date = sta_date;
		this.sta_time = sta_time;
		this.arr_place = arr_place;
		this.arr_time = arr_time;
		
	}




	public Reservation(String res_type, int res_no, String mem_no, String sta_place, String sta_date, String sta_time,
			String arr_place, String arr_time) {
		super();

		this.res_type = res_type;
		this.res_no = res_no;
		this.mem_no = mem_no;
		this.sta_place = sta_place;
		this.sta_date = sta_date;
		this.sta_time = sta_time;
		this.arr_place = arr_place;
		this.arr_time = arr_time;
	}

	public Reservation(String baggage, int amount, String sta_place, String sta_date, String sta_time, String arr_place,
			String arr_time) {
		super();

		this.baggage = baggage;
		this.amount = amount;
		this.sta_place = sta_place;
		this.sta_date = sta_date;
		this.sta_time = sta_time;
		this.arr_place = sta_place;
		this.arr_time = arr_time;
	}




	public Reservation(int res_no, String res_type, String baggage, int amount, String sta_place,
			 String sta_time, String arr_place, String arr_time, String status, String sta_date) {
		super();

		this.res_no = res_no;
		this.res_type = res_type;
		this.baggage = baggage;
		this.amount = amount;
		this.sta_place = sta_place;
		this.sta_date = sta_date;
		this.sta_time = sta_time;
		this.arr_place = arr_place;
		this.arr_time = arr_time;
		this.status = status;
		
		
	}


	public Reservation(String baggage, int amount, String sta_place, String sta_time, String arr_place,
			String arr_time) {
		super();
		this.baggage = baggage;
		this.amount = amount;
		this.sta_place = sta_place;
		this.sta_time = sta_time;
		this.arr_place = arr_place;
		this.arr_time = arr_time;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getMem_no() {
		return mem_no;
	}

	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}

	public String getRes_type() {
		return res_type;
	}

	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}

	public String getBaggage() {
		return baggage;
	}

	public void setBaggage(String baggage) {
		this.baggage = baggage;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getSta_date() {
		return sta_date;
	}

	public void setSta_date(String sta_date) {
		this.sta_date = sta_date;
	}

	public String getSta_place() {
		return sta_place;
	}

	public void setSta_place(String sta_place) {
		this.sta_place = sta_place;
	}

	public String getArr_place() {
		return arr_place;
	}

	public void setArr_place(String arr_place) {
		this.arr_place = arr_place;
	}

	public String getSta_time() {
		return sta_time;
	}

	public void setSta_time(String sta_time) {
		this.sta_time = sta_time;
	}

	public String getArr_time() {
		return arr_time;
	}

	public void setArr_time(String arr_time) {
		this.arr_time = arr_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", mem_no=" + mem_no + ", res_type=" + res_type + ", baggage="
				+ baggage + ", amount=" + amount + ", sta_date=" + sta_date + ", sta_place=" + sta_place
				+ ", arr_place=" + arr_place + ", sta_time=" + sta_time + ", arr_time=" + arr_time + ", status="
				+ status + "]";
	}

	
	
	
}
