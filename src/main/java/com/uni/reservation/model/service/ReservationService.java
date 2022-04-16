package com.uni.reservation.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.reservation.model.dao.ReservationDao;
import com.uni.reservation.model.dto.Reservation;
public class ReservationService {

	public int insertReservation(Reservation r) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().insertReservation(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteReservation(int res_no) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().ReservationDelete(conn, res_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateReservation(Reservation r) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().updateReservation(conn, r);
		

		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result; 
	}

	public ArrayList<Reservation> selectList(String mem_no) {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new ReservationDao().selectResList(conn, mem_no);
		close(conn);
		
		return list;
	}

	public Reservation selectUpdateReservation(int res_no) {
		Connection conn = getConnection();
		
		Reservation r = new ReservationDao().selectReservation(conn, res_no);
		close(conn);
		return r;
		
	}

	public ArrayList<Reservation> selectNonList(String res_no) {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new ReservationDao().selectNonResList(conn, res_no);
		close(conn);
		
		return list;
	}

	
	

	
	
	
}
