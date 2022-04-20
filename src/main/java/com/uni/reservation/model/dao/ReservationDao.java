package com.uni.reservation.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.notice.model.dao.NoticeDao;
import com.uni.reservation.model.dto.PageInfo;
import com.uni.reservation.model.dto.Reservation;


public class ReservationDao {
	private Properties prop = new Properties();

	public ReservationDao() {
		String fileName = NoticeDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
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

	public int insertRes(Connection conn, Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		// 
		//INSERT INTO RESERVATION VALUES(SEQ_RESNO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT)
		// ?횐번, ?예약, ?짐, ?수량, ?출발날짜시간, ?출발장소, ?도착장소, ?도착날짜시간
		//?횐번, ?예약종류, ?짐종류, ?수량, ?출발날짜, ?출발장소, ?도착장소, ?출발시간, ?도착시간 , 상태DEFAULT)
		String sql = prop.getProperty("insertRes");
		System.out.println(r);

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getMem_no());
			pstmt.setString(2, r.getRes_type());
			pstmt.setString(3, r.getBaggage());
			pstmt.setInt(4, r.getAmount());
			pstmt.setString(5, r.getSta_date());
			pstmt.setString(6, r.getSta_place());
			pstmt.setString(7, r.getArr_place());
//			pstmt.setString(8, r.getSta_time());
//			pstmt.setString(9, r.getArr_time());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection conn, String userNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("getListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
// getListCount=SELECT COUNT(*) FROM RESERVATION WHERE MEM_NO=? AND STATUS != 'D'
			listCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return listCount;
	}

	public int mgetListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("mgetListCount");
// mgetListCount=SELECT COUNT(*) FROM RESERVATION WHERE STATUS != 'D'
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Reservation> selectList(Connection conn, String userNo, PageInfo pi) {
		
		ArrayList<Reservation> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
// selectList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT RES_NO,MEM_NO,RES_TYPE,BAGGAGE,AMOUNT,STA_DATE,STA_PLACE,ARR_PLACE,STA_TIME,ARR_TIME,STATUS FROM RESERVATION R JOIN MEMBER USING(MEM_NO) WHERE MEM_NO=? AND (R.STATUS != 'D') ORDER BY RES_NO DESC) A) WHERE RNUM BETWEEN ? AND ?

		int startRow = (pi.getCurrentPage() - 1) * pi.getresLimit() + 1;
		int endRow = startRow + pi.getresLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			// RES_NO,MEM_NO,RES_TYPE,BAGGAGE,AMOUNT,STA_DATE,STA_PLACE,ARR_PLACE,STA_TIME,ARR_TIME,STATUS
			while (rset.next()) {
				list.add(new Reservation(
						rset.getInt("RES_NO"),
						rset.getString("MEM_NO"),
						rset.getString("RES_TYPE"),
						rset.getString("BAGGAGE"),
						rset.getInt("AMOUNT"),
						rset.getString("STA_DATE"),
						rset.getString("STA_PLACE"),
						rset.getString("ARR_PLACE"),
						rset.getString("STA_TIME"),
						rset.getString("ARR_TIME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Reservation> mselectList(Connection conn, PageInfo pi) {
		ArrayList<Reservation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("mselectList");
// mselectList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT RES_NO,MEM_NO,RES_TYPE,BAGGAGE,AMOUNT,STA_DATE,STA_PLACE,ARR_PLACE,STA_TIME,ARR_TIME,STATUS FROM RESERVATION R JOIN MEMBER USING(MEM_NO) WHERE R.STATUS != 'D' ORDER BY RES_NO DESC) A) WHERE RNUM BETWEEN ? AND ?

		int startRow = (pi.getCurrentPage() - 1) * pi.getresLimit() + 1;
		int endRow = startRow + pi.getresLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			// RES_NO,MEM_NO,RES_TYPE,BAGGAGE,AMOUNT,STA_DATE,STA_PLACE,ARR_PLACE,STA_TIME,ARR_TIME,STATUS
			while (rset.next()) {
				list.add(new Reservation(
						rset.getInt("RES_NO"),
						rset.getString("MEM_NO"),
						rset.getString("RES_TYPE"),
						rset.getString("BAGGAGE"),
						rset.getInt("AMOUNT"),
						rset.getString("STA_DATE"),
						rset.getString("STA_PLACE"),
						rset.getString("ARR_PLACE"),
						rset.getString("STA_TIME"),
						rset.getString("ARR_TIME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Reservation selectRes(Connection conn, int rno) {

		Reservation r = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			rset = pstmt.executeQuery();
			//selectList=SELECT 
			//RES_NO, MEM_NO, RES_TYPE, BAGGAGE, AMOUNT, STA_DATE, STA_PLACE, ARR_PLACE, STA_TIME, ARR_TIME,STATUS 
			// FROM RESERVATION WHERE RES_NO=?

			if (rset.next()) {
				r = new Reservation(
						rset.getInt("RES_NO"),
						rset.getString("MEM_NO"),
						rset.getString("RES_TYPE"),
						rset.getString("BAGGAGE"),
						rset.getInt("AMOUNT"),
						rset.getString("STA_DATE"),
						rset.getString("STA_PLACE"),
						rset.getString("ARR_PLACE"),
						rset.getString("STA_TIME"),
						rset.getString("ARR_TIME"),
						rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}

	public int UpdateRes(Connection conn, Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("UpdateRes");
		// UpdateRes=UPDATE RESERVATION SET 
		//BAGGAGE=?, AMOUNT=?, STA_PLACE=?, STA_DATE=?, 
		//STA_TIME=sysdate, ARR_PLACE=?, ARR_TIME=sysdate 
		//WHERE RES_NO=?

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getBaggage());
			pstmt.setInt(2, r.getAmount());
			pstmt.setString(3, r.getSta_place());
			pstmt.setString(4, r.getSta_date());
			pstmt.setString(5, r.getArr_place());
			pstmt.setInt(6, r.getRes_no());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteRes(Connection conn, int rno) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteRes");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
