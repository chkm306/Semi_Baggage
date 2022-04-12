package com.uni.board.model.dao;

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

import com.uni.board.model.dto.Board;

public class NoticeDao { 
	private Properties prop = new Properties();

	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/n-query.properties").getPath();
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

	public ArrayList<Board> selectList(Connection conn) {
		ArrayList<Board> bList = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		//selectList=SELECT N_NO, N_TITLE, N_CATEGORY, N_CONTENT, N_DATE, N_COUNT, ATT_FILENO FROM N_CONTENT ORDER BY N_NO DESC;

		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bList.add(new Board(rset.getInt("N_NO"),
									rset.getString("N_TITLE"),
									rset.getString("N_CATEGORY"),
									rset.getString("N_CONTENT"),
									rset.getDate("N_DATE"),
									rset.getInt("N_COUNT"),
									rset.getInt("ATT_FILENO")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		for(Board b : bList) {
			System.out.println("dao : " + b.getbTitle());
		}
		return bList;
	}

	public Board selectNotice(int bno, Connection conn) {
		Board notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		//selectNotice=SELECT N_NO, N_TITLE, N_CATEGORY, N_CONTENT, N_DATE, N_COUNT, ATT_FILENO FROM N_CONTENT WHERE N_NO = ?
 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Board(rset.getInt("N_NO"),
								   rset.getString("N_TITLE"),
								   rset.getString("N_CATEGORY"),
								   rset.getString("N_CONTENT"),
								   rset.getDate("N_DATE"),
								   rset.getInt("N_COUNT"),
								   rset.getInt("ATT_FILENO")
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return notice;
	}

}
