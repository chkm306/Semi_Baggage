package com.uni.storage.model.dao;

import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Properties;

import com.uni.storage.model.dto.Storage;

public class StorageDao {
	private Properties prop = new Properties();
	public StorageDao() {
		String fileName = StorageDao.class.getResource("/sql/storage/s-query.properties").getPath();
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
	public ArrayList<Storage> searchStorage(Connection conn, String address) {
		System.out.println("searchStorage dao 실행됨");
		ArrayList<Storage> sList1 = new ArrayList<Storage>();
		ArrayList<Storage> sList = new ArrayList<Storage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchStorage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, address);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				if(rset.getString("STO_ADDRESS").contains(address)) {
				sList1.add(new Storage(rset.getInt("STO_NO"),
									  rset.getString("STO_ADDRESS"),
									  rset.getString("MEM_NO"),
									  rset.getString("STO_NAME")
									  
						)); 
				}
			}
			/*
			for(int i = 0; i < sList1.size(); i++) {
				if(sList1.contains(address)) {
					sList = new ArrayList((Collection) sList1.get(i));
				}
			}
			System.out.println("test : " + sList1.get(0));
			*/
			
			//System.out.println(sList.get(1));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("sList : " + sList.isEmpty());
		
		return sList1;
	}
	public Storage selectStorage(Connection conn, int sr_sno) {
		Storage storage = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStorage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sr_sno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				storage = new Storage(rset.getInt("STO_NO"), 
									rset.getString("STO_ADDRESS"),
									rset.getString("MEM_NO"), 
									rset.getString("STO_NAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return storage;
	}
	
	public int insertStorageReserve(Connection conn, Storage sr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("storageReserve");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sr.getSr_sno());
			pstmt.setString(2, sr.getSr_address());
			pstmt.setString(3, sr.getMem_no());
			pstmt.setDate(4, sr.getSr_start());
			pstmt.setDate(5, sr.getSr_end());
			pstmt.setString(6, sr.getSr_baggage());
			pstmt.setInt(7, sr.getSr_amount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Storage selectStoRes(Connection conn, int sr_sno, String userNo) {
		Storage sr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStoRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sr_sno);
			pstmt.setString(2, userNo);
			
			rset = pstmt.executeQuery();
			
			/*
			 * 
			 * SR_NO
				SR_SNO
				SR_ADDRESS
				MEM_NO
				SR_START
				SR_END
				SR_BAGGAGE
				SR_AMOUNT
			 * */
			
			if(rset.next()) {
				sr = new Storage(rset.getInt("SR_NO"),
								rset.getInt("SR_SNO"),
								rset.getString("SR_ADDRESS"),
								rset.getString("MEM_NO"),
								rset.getDate("SR_START"),
								rset.getDate("SR_END"),
								rset.getString("SR_BAGGAGE"),
								rset.getInt("SR_AMOUNT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return sr;
	}
	
	public int insertStorage(Connection conn, String userNo, String storageAddress, String storageName) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertStorage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storageAddress);
			pstmt.setString(2, userNo);
			pstmt.setString(3, storageName);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Storage> reservationList(Connection conn) {
		ArrayList<Storage> list = new ArrayList<Storage>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reserveList");
		
		/*SR_NO	NUMBER
SR_SNO	NUMBER
SR_ADDRESS	VARCHAR2(1000 BYTE)
MEM_NO	VARCHAR2(10 BYTE)
SR_START	DATE
SR_END	DATE
SR_BAGGAGE	VARCHAR2(100 BYTE)
SR_AMOUNT	NUMBER*/
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Storage(rset.getInt("SR_NO"),
									rset.getInt("SR_SNO"),
									rset.getString("SR_ADDRESS"),
									rset.getString("MEM_NO"),
									rset.getDate("SR_START"),
									rset.getDate("SR_END"),
									rset.getString("SR_BAGGAGE"),
									rset.getInt("SR_AMOUNT")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	public int deleteManageStoReserve(Connection conn, int sr_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteStoRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sr_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Storage> StorageList(Connection conn) {
		ArrayList<Storage> list = new ArrayList<Storage>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("storageList");
		
		/*STO_NO	NUMBER
STO_ADDRESS	VARCHAR2(1000 BYTE)
MEM_NO	VARCHAR2(10 BYTE)
STO_NAME	VARCHAR2(100 BYTE)*/
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Storage(rset.getInt("STO_NO"),
									rset.getString("STO_ADDRESS"),
									rset.getString("MEM_NO"),
									rset.getString("STO_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	public int updateStorage(Connection conn, int storageNo, String storageName, String storageAddress) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateStorage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storageName);
			pstmt.setString(2, storageAddress);
			pstmt.setInt(3, storageNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteStorage(Connection conn, int sto_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteStorage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sto_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
