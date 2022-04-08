package com.uni.reservation.model.dto;

import java.sql.Date;

public class Reservation {

	private int res_no;
	private int mem_no;
	private String res_type;
	private String baggage;
	private int amount;
	private Date sta_date;
	private String sta_place;
	private String arr_place;
	private Date sta_time;
	private Date arr_time;
	private String status;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(int res_no, int mem_no, String res_type, String baggage, int amount, Date sta_date,
			String sta_place, String arr_place, Date sta_time, Date arr_time, String status) {
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

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
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

	public Date getSta_date() {
		return sta_date;
	}

	public void setSta_date(Date sta_date) {
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

	public Date getSta_time() {
		return sta_time;
	}

	public void setSta_time(Date sta_time) {
		this.sta_time = sta_time;
	}

	public Date getArr_time() {
		return arr_time;
	}

	public void setArr_time(Date arr_time) {
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
