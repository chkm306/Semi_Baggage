package com.uni.reservation.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.reservation.model.dto.Reservation;
import static com.uni.common.JDBCTemplate.*;

public class ReservationDao {

	Properties prop = new Properties();
	
	public ReservationDao() {
		
		
		
		String fileName = ReservationDao.class.getResource("/sql/reservationDao/reservation-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	
	public int insertReservation(Connection conn, Reservation r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		//insertReservation=INSERT IN TO RESERVATION(?, SEQ_MEM_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT);

//		RES_TYPE
//		BAGGAGE
//		AMOUNT
//		STA_DATE
//		STA_PLACE
//		ARR_PLACE
//		STA_TIME
//		ARR_TIME

		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRes_type());
			pstmt.setString(2, r.getBaggage());
			pstmt.setInt(3, r.getAmount());
			pstmt.setString(4, r.getSta_place());
			pstmt.setString(5, r.getSta_date());
			pstmt.setString(6, r.getSta_time());
			pstmt.setString(6, r.getArr_place());
			pstmt.setString(7, r.getArr_time());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int ReservationDelete(Connection conn, int res_no) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		//deleteReservation=DELETE * FROM RESERAVTION WHERE WHERE RES_NO=? 
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, res_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Reservation selectReservation(Connection conn, int mem_no) {
		
		Reservation res = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//SELECT * FROM MEMBER WHERE USER_ID=? AND STATUS='Y'
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_no);
			
			rset = pstmt.executeQuery(); //하나의 ResultSet을 만드는 SQL문에서 사용한다. 주로 SELECT문을 이용하는 조회에서 사용한다.
										//데이터베이스에서 데이터를 가져와서 ResultSet을 반환한다.(ResultSet)
			
//			RES_NO
//			MEM_NO
//			RES_TYPE
//			BAGGAGE
//			AMOUNT
//			STA_DATE
//			STA_PLACE
//			ARR_PLACE
//			STA_TIME
//			ARR_TIME
//			STATUS
			
			
			if(rset.next()) {
				res = new Reservation(rset.getInt("RES_NO"),
									rset.getString("MEM_NO"),
									rset.getString("RES_TYPE"),
									rset.getString("BAGGAGE"),
									rset.getInt("AMOUNT"),
									rset.getString("STA_DATE"),
									rset.getString("STA_PLACE"),
									rset.getString("ARR_PLACE"),
									rset.getString("STA_TIME"),
									rset.getString("ARR_TIME"),
									rset.getString("STATUS")
									);
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return res;
	}

	public int updateReservation(Connection conn, Reservation r) {
		
		int result = 0;
		PreparedStatement pstmt = null; // SQL구문 실행하는 역할
		
		//updateReservation=UPDATE RESERVATION SET BAGGAGE=?, AMOUNT=?, STA_PLACE=?, STA_DATE=?, STA_TIME=?, ARR_PLACE=?, ARR_TIME=? WHERE SEQ_MEM_NO.NEXTVAL
		String sql = prop.getProperty("updateMember");
		
		try {// 인덱스 틀리면 에러남, 매개변수값
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, r.getBaggage());
			pstmt.setInt(2, r.getAmount());
			pstmt.setString(3, r.getSta_place());
			pstmt.setString(4, r.getSta_date());
			pstmt.setString(5, r.getSta_time());
			pstmt.setString(6, r.getArr_place());
			pstmt.setString(7, r.getArr_time());
			
			result = pstmt.executeUpdate(); //DB에서 데이터추가, 삭제, 수정하는 SQL문을 실행하는데 사용함.
											//해당 SQL문 실행에 영향을 받는 행 수를 반환한다. (int)
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Reservation> selectResList(Connection conn, String mem_no) {
		
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemResList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
					
						
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
				
				
		return list;
	}

	public ArrayList<Reservation> selectNonResList(Connection conn, String res_no) {
		
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemResList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			
					
						
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
				
				
		return list;
		
		
	}

	
	
	
}
