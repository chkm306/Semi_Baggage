package com.uni.notice.model.dao;

import static com.uni.common.JDBCTemplate.*;

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

import com.uni.notice.model.dto.Notice;
import com.uni.notice.model.dto.PageInfo;

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
	/*
	public ArrayList<Notice> selectList(Connection conn) {
		ArrayList<Notice> bList = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		//selectList=SELECT N_NO, N_TITLE, N_CATEGORY, N_CONTENT, N_DATE, N_COUNT, ATT_FILENO FROM N_CONTENT ORDER BY N_NO DESC;

		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bList.add(new Notice(rset.getInt("N_NO"),
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
		
		for(Notice b : bList) {
			System.out.println("dao : " + b.getbTitle());
		}
		return bList;
	}
	*/

	public Notice selectNotice(int bno, Connection conn) {
		System.out.println("selectNotice dao 실행됨");

		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		//selectNotice=SELECT N_NO, N_TITLE, N_CONTENT, N_DATE, N_COUNT FROM N_CONTENT WHERE N_NO = ?
 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice(rset.getInt("N_NO"),
						rset.getString("N_TITLE"),
						rset.getDate("N_DATE"),
						rset.getInt("N_COUNT"),
						rset.getString("N_CONTENT")

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
	

	public int getListCount(Connection conn) {
		System.out.println("getListCount dao 실행됨");

		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		//getListCount=SELECT COUNT(*) FROM N_CONTENT 

		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
	
		
		return listCount;
	}

	public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
		System.out.println("selectList dao 실행됨");

		ArrayList<Notice> bList = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		//selectList=SELECT N_NO, N_TITLE, , N_CONTENT, N_DATE, N_COUNT,  FROM N_CONTENT ORDER BY N_NO DESC;
		
		int startRow = (pi.getCurrentPage()-1) * pi.getNoticeLimit() + 1;
		int endRow = startRow + pi.getNoticeLimit() - 1;

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bList.add(new Notice(rset.getInt("N_NO"),
									rset.getString("N_TITLE"),
									rset.getDate("N_DATE"),
									rset.getInt("N_COUNT"),
									rset.getString("N_CONTENT")

						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("startNum : " + startRow );
		System.out.println("endRow : " + endRow);
		return bList;
	}

	public int increaseCount(Connection conn, int bno) {
		System.out.println("increaseCount dao 실행됨");

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteNotice(int bno, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int lastNum(Connection conn) {
		System.out.println("lastNum dao 실행됨");
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("lastN_no");
		try {
			stmt = conn.prepareStatement(sql);
			rset = stmt.executeQuery(sql);
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		System.out.println("dao result : " + result);
		return result+1;
	}

	public int insertNotice(String title, String content, int lastNum, Connection conn) {
		System.out.println("insertNotice dao 실행됨");
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lastNum);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int updateNotice(int bno, String title, String content, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bno);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("updateNotice : " + result);
		
		return result;
	}

	public ArrayList<Notice> searchNotice(Connection conn, String keyword, PageInfo pi) {
		System.out.println("searchNotice dao 실행됨");
		ArrayList<Notice> nList = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		//selectList=SELECT N_NO, N_TITLE, , N_CONTENT, N_DATE, N_COUNT,  FROM N_CONTENT ORDER BY N_NO DESC;
		
		int startRow = (pi.getCurrentPage()-1) * pi.getNoticeLimit() + 1;
		int endRow = startRow + pi.getNoticeLimit() - 1;

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				if(rset.getString("N_TITLE").contains(keyword) || rset.getString("N_CONTENT").contains(keyword)) {
					nList.add(new Notice(rset.getInt("N_NO"),
										rset.getString("N_TITLE"),
										rset.getDate("N_DATE"),
										rset.getInt("N_COUNT"),
										rset.getString("N_CONTENT")

				));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("nList: " + nList.isEmpty());
		// TODO Auto-generated method stub
		return nList;
	}

	

}
