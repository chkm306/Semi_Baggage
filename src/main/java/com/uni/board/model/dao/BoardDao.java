package com.uni.board.model.dao;

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

import com.uni.board.model.dto.Board_Info;
import com.uni.board.model.dto.Board_content;
import com.uni.board.model.dto.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/b-query.properties").getPath();
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

	public ArrayList<Board_Info> selectList(PageInfo pi, Connection conn, int category) {
		System.out.println();
		System.out.println("selectList dao 실행됨");
		System.out.println();

		ArrayList<Board_Info> bList = new ArrayList<Board_Info>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		//selectList=SELECT N_NO, N_TITLE, , N_CONTENT, N_DATE, N_COUNT,  FROM N_CONTENT ORDER BY N_NO DESC;
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimitLimit() + 1;
		int endRow = startRow + pi.getBoardLimitLimit() - 1;

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bList.add(new Board_Info(rset.getInt("B_NO"),
										 rset.getString("B_TITLE"),
										 rset.getInt("B_CATEGORY"),
										 rset.getDate("T_DATE"),
										 rset.getInt("T_COUNT"),
										 rset.getString("B_ORIGIN"),
										 rset.getString("B_CHANGE"),
										 rset.getString("B_PATH"),
										 rset.getString("B_STATUS")
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

	public int getListCount(Connection conn) {
		System.out.println();
		System.out.println("getListCount dao 실행됨");
		System.out.println();

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
	
		System.out.println("listCount : " + listCount);
		return listCount;
	}

	public int getlastNum(Connection conn) {
		System.out.println();
		System.out.println("getlastNum dao 실행됨");
		System.out.println();
		
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

	public int insertBoard(Connection conn, Board_Info b) {
		System.out.println();
		System.out.println("insertBoard dao 실행됨");
		System.out.println();
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBorad");

		//insertBorad=INSERT INTO B_INFO VALUES (?, ?, 1, SYSDATE, 1, ?, ?, ?)
		//INSERT INTO B_INFO VALUES (no, title, 1, SYSDATE, 1, origin, change, path)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getB_No());
			pstmt.setString(2, b.getB_Title());
			pstmt.setString(3, b.getB_Origin());
			pstmt.setString(4, b.getB_Change());
			pstmt.setString(5, b.getB_Path());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		System.out.println("dao result : " + result);
		return result;
	}

	public int getOrderNum(Connection conn, int b_no) {
		System.out.println();
		System.out.println("getOrderNum dao 실행됨");
		System.out.println();

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getOrderNum");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1)+1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println();
		System.out.println("getOrderNum dao : " + result);
		System.out.println();		
		return result;
	}

	public int insertContent(Connection conn, Board_content b) {
		System.out.println();
		System.out.println("insertContent dao 실행됨");
		System.out.println();
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBordContent");

		//insertBorad=INSERT INTO B_INFO VALUES (?, ?, 1, SYSDATE, 1, ?, ?, ?)
		//INSERT INTO B_INFO VALUES (no, title, 1, SYSDATE, 1, origin, change, path)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getB_No());
			pstmt.setString(2, b.getB_Contents());
			pstmt.setInt(3, b.getB_Order());
			pstmt.setString(4, b.getB_Origin());
			pstmt.setString(5, b.getB_Change());
			pstmt.setString(6, b.getB_Path());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public Board_Info selectBoard(Connection conn, int b_no) {
		System.out.println();
		System.out.println("selectBoard dao 실행됨");
		System.out.println();
		
		Board_Info b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		//selectNotice=SELECT N_NO, N_TITLE, N_CONTENT, N_DATE, N_COUNT FROM N_CONTENT WHERE N_NO = ?
 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.setString(2, "Y");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board_Info(rset.getInt("B_NO"),
								   rset.getString("B_TITLE"),
								   rset.getInt("B_CATEGORY"),
								   rset.getDate("T_DATE"),
								   rset.getInt("T_COUNT"),
								   rset.getString("B_ORIGIN"),
								   rset.getString("B_CHANGE"),
								   rset.getString("B_PATH"),
								   rset.getString("B_STATUS")

						
						);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return b;	
		
	}

	public ArrayList<Board_content> selectBoardList(Connection conn, int b_no) {
		System.out.println();
		System.out.println("selectBoardList dao 실행됨");
		System.out.println();

		ArrayList<Board_content> bList = new ArrayList<Board_content>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardList");
		//selectList=SELECT N_NO, N_TITLE, , N_CONTENT, N_DATE, N_COUNT,  FROM N_CONTENT ORDER BY N_NO DESC;


		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bList.add(new Board_content(rset.getInt("B_NO"),
											rset.getString("B_CONTENTS"),
											rset.getInt("B_ORDER"),
											rset.getString("B_ORIGIN"),
											rset.getString("B_CHANGE"),
											rset.getString("B_PATH"),
											rset.getString("B_STATUS")

						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return bList;	
		
	}

	public int deleteBoardInfo(int b_no, Connection conn) {
		System.out.println();
		System.out.println("deleteBoardInfo dao 실행됨");
		System.out.println();
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	
	}

	public int deleteBoardContent(int b_no, Connection conn) {
		System.out.println();
		System.out.println("deleteBoardContent dao 실행됨");
		System.out.println();
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoardContent");
		


		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);

			
			result = pstmt.executeUpdate();
			System.out.println();
			System.out.println("pstmt.executeUpdate() : "  + pstmt.executeUpdate());
			System.out.println();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	
	}

	public int increaseCount(int b_no, Connection conn) {
		System.out.println("increaseCount dao 실행됨");

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBoard(Board_Info b, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInfo");
		//updateInfo=UPDATE B_INFO SET B_TITLE = ?, B_ORIGIN = ?, B_CHANGE = ?, B_PATH = ? WHERE B_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getB_Title());
			pstmt.setString(2, b.getB_Origin());
			pstmt.setString(3, b.getB_Change());
			pstmt.setString(4, b.getB_Path());
			pstmt.setInt(5, b.getB_No());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoardContent(Board_content b, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoardContent");
		//updateBoardContent=UPDATE B_CONTENT SET B_CONTENTS = ?, B_ORIGIN = ?, B_CHANGE = ?, B_PATH = ? WHERE B_NO = ? AND B_ORDER = ?		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getB_Contents());
			pstmt.setString(2, b.getB_Origin());
			pstmt.setString(3, b.getB_Change());
			pstmt.setString(4, b.getB_Path());
			pstmt.setInt(5, b.getB_No());
			pstmt.setInt(6, b.getB_Order());
			
			result = pstmt.executeUpdate();
			
			if(pstmt.executeUpdate() > 0) {
				result = pstmt.executeUpdate();
			} else {
				result = 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



}
