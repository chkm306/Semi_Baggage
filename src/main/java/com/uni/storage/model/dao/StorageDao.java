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
		ArrayList<Storage> sList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchStorage");
		String address1 = "%" + address + "%";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address1);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				sList.add(new Storage(rset.getInt("STO_NO"),
									  rset.getString("STO_ADDRESS"),
									  rset.getString("MEM_NO"),
									  rset.getString("STO_NAME")
						));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sList;
	}
}
