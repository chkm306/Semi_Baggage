package com.uni.reservation.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.reservation.model.dao.ReservationDao;
import com.uni.reservation.model.dto.PageInfo;
import com.uni.reservation.model.dto.Reservation;

public class ReservationService {

	public int insertRes(Reservation r) {
		Connection conn = getConnection();

		int result = new ReservationDao().insertRes(conn, r);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getListCount(String userNo) {
		Connection conn = getConnection();

		int listCount = new ReservationDao().getListCount(conn, userNo);
		close(conn);
		return listCount;
	}

	public int mgetListCount() {
		Connection conn = getConnection();

		int listCount = new ReservationDao().mgetListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Reservation> selectList(String userNo, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Reservation> list = new ReservationDao().selectList(conn, userNo, pi);
		close(conn);
		return list;
	}

	public ArrayList<Reservation> mselectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Reservation> list = new ReservationDao().mselectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public Reservation selectRes(int rno) {
		Connection conn = getConnection();
		
		Reservation r = new ReservationDao().selectRes(conn, rno);
		
		close(conn);
		return r;
	}

	public int UpdateRes(Reservation r) {
		Connection conn = getConnection();

		int result = new ReservationDao().UpdateRes(conn, r);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteRes(int rno) {
		Connection conn = getConnection();

		int result = new ReservationDao().deleteRes(conn, rno);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

}
