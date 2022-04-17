package com.uni.storage.model.dto;

import java.sql.Date;

public class Storage {

   private int sr_no;
   private int sr_sno;
   private String sr_address;
   private String mem_no;
   private Date sr_start;
   private Date sr_end;
   private String sr_baggage;
   private int sr_amount;
   
   private int sto_no;
   private String sto_name;
   private String sto_address;
   
   public Storage() {
	// TODO Auto-generated constructor stub
   }

   

   public Storage(int sto_no, String sto_address, String mem_no, String sto_name) {
	super();
	this.sto_no = sto_no;
	this.sto_address = sto_address;
	this.mem_no = mem_no;
	this.sto_name = sto_name;

	
}



public Storage(int sr_no, int sr_sno, String sr_address, String mem_no, Date sr_start, Date sr_end, String sr_baggage,
         int sr_amount) {
      super();
      this.sr_no = sr_no;
      this.sr_sno = sr_sno;
      this.sr_address = sr_address;
      this.mem_no = mem_no;
      this.sr_start = sr_start;
      this.sr_end = sr_end;
      this.sr_baggage = sr_baggage;
      this.sr_amount = sr_amount;
   }
   
	

   public int getSr_no() {
	return sr_no;
}



public void setSr_no(int sr_no) {
	this.sr_no = sr_no;
}



public int getSr_sno() {
	return sr_sno;
}



public void setSr_sno(int sr_sno) {
	this.sr_sno = sr_sno;
}



public String getSr_address() {
	return sr_address;
}



public void setSr_address(String sr_address) {
	this.sr_address = sr_address;
}



public String getMem_no() {
	return mem_no;
}



public void setMem_no(String mem_no) {
	this.mem_no = mem_no;
}



public Date getSr_start() {
	return sr_start;
}



public void setSr_start(Date sr_start) {
	this.sr_start = sr_start;
}



public Date getSr_end() {
	return sr_end;
}



public void setSr_end(Date sr_end) {
	this.sr_end = sr_end;
}



public String getSr_baggage() {
	return sr_baggage;
}



public void setSr_baggage(String sr_baggage) {
	this.sr_baggage = sr_baggage;
}



public int getSr_amount() {
	return sr_amount;
}



public void setSr_amount(int sr_amount) {
	this.sr_amount = sr_amount;
}



public int getSto_no() {
	return sto_no;
}



public void setSto_no(int sto_no) {
	this.sto_no = sto_no;
}



public String getSto_name() {
	return sto_name;
}



public void setSto_name(String sto_name) {
	this.sto_name = sto_name;
}



public String getSto_address() {
	return sto_address;
}



public void setSto_address(String sto_address) {
	this.sto_address = sto_address;
}



@Override
   public String toString() {
      return sto_no + " " + sto_address + " " + mem_no + " " + sto_name;
   }
//public Storage(int sto_no, String sto_address, String mem_no, String sto_name) {

   
}