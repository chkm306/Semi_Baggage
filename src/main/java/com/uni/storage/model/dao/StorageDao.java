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
}
