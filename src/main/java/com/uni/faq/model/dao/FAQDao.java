package com.uni.faq.model.dao;

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

import com.uni.faq.model.dto.Answer;
import com.uni.faq.model.dto.Attachment;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.dto.PageInfo;

public class FAQDao {
	private Properties prop = new Properties();
	
	public FAQDao() {
		String fileName = FAQDao.class.getResource("/sql/faq/faq-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn, String userId) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("getListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			listCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<FAQ> selectList(Connection conn, String userId, PageInfo pi) {
		
		ArrayList<FAQ> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");

		// selectList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT FAQ_NO,
		// FCATE_NAME, FAQ_TITLE, MEM_NAME, CREATE_DATE, STATUS FROM FAQ F JOIN
		// FAQ_CATEGORY USING(FCATE_NO) JOIN MEMBER USING(MEM_NO) WHERE F.STATUS='Y' OR
		// F.STATUS='N' ORDER BY FAQ_NO DESC) A) WHERE RNUM BETWEEN ? AND ?

		int startRow = (pi.getCurrentPage() - 1) * pi.getFAQLimit() + 1;
		int endRow = startRow + pi.getFAQLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			// FAQ_NO, FCATE_NAME, FAQ_TITLE, MEM_NAME, CREATE_DATE, STATUS
			while (rset.next()) {
				list.add(new FAQ(
						rset.getInt("FAQ_NO"), 
						rset.getString("FCATE_NAME"),
						rset.getString("FAQ_TITLE"), 
						rset.getString("MEM_NAME"), 
						rset.getDate("CREATE_DATE"),
						rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public FAQ selectFAQ(Connection conn, int fno) {
		
		FAQ f = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);

			rset = pstmt.executeQuery();
			//selectFAQ=SELECT FAQ_NO, FCATE_NAME, FAQ_TITLE, 
			//FAQ_CONTENT, MEM_NO, CREATE_DATE 
			//FROM FAQ F JOIN MEMBER USING(MEM_NO) LEFT JOIN FAQ_CATEGORY USING(FCATE_NO) 
			//WHERE FAQ_NO=?
			
			// selectFAQ=SELECT FAQ_NO, FCATE_NAME, FAQ_TITLE, FAQ_CONTENT, MEM_NO, CREATE_DATE, STATUS 
			// FROM FAQ F JOIN MEMBER USING(MEM_NO) LEFT JOIN FAQ_CATEGORY USING(FCATE_NO) WHERE FAQ_NO=?
			
			if (rset.next()) {
				f = new FAQ(
						rset.getInt("FAQ_NO"), 
						rset.getString("FCATE_NAME"), 
						rset.getString("FAQ_TITLE"),
						rset.getString("FAQ_CONTENT"), 
						rset.getString("MEM_NAME"), 
						rset.getDate("CREATE_DATE"),
						rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
	}

	public int increaseCount(Connection conn, int fno) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		// insertFAQ=INSERT INTO FAQ VALUES(SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, DEFAULT)
		// 회원번호, 카테고리번호, 문의제목, 문의내용
		
		String sql = prop.getProperty("insertFAQ");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, f.getMemNo());
			pstmt.setInt(2, Integer.parseInt(f.getFaqCategory()));
			pstmt.setString(3, f.getFaqTitle());
			pstmt.setString(4, f.getFaqContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateFAQ(Connection conn, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;
		// updateFAQ=UPDATE FAQ SET FCATE_NO=?, FAQ_TITLE=?, FAQ_CONTENT=? WHERE FAQ_NO=?
		// 카테고리번호, 문의제목, 문의내용, 문의번호
		String sql = prop.getProperty("updateFAQ");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, Integer.parseInt(f.getFaqCategory()));
			pstmt.setString(2, f.getFaqTitle());
			pstmt.setString(3, f.getFaqContent());
			pstmt.setInt(4, f.getFaqNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFAQ(Connection conn, int fid) {

		// deleteFAQ=UPDATE FAQ SET STATUS='D' WHERE FAQ_NO=?
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteFAQ");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, f.getMemNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		// updateAttachment=UPDATE ATTACHMENT SET CHANGE_NAME=?, ORIGIN_NAME=?,
		// FILE_PATH=? WHERE FILE_NO=?
		String sql = prop.getProperty("updateAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at, FAQ f) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNewAttachment");
		// insertNewAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, ?, ?, ?, ?, SYSDATE, 1, DEFAULT)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefFAQNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setString(5, f.getMemNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Attachment selectAttachment(Connection conn, int fid) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);
			//selectAttachment=SELECT ATT_FILENO, ATT_ORIGIN, ATT_CHANGE 
			// FROM ATTACHMENT WHERE CON_NO=? AND (ATT_STATUS='Y' OR ATT_STATUS='N')


			rset = pstmt.executeQuery();

			if (rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("ATT_FILENO"));
				at.setOriginName(rset.getString("ATT_ORIGIN"));
				at.setChangeName(rset.getString("ATT_CHANGE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}

	public int deleteAttachment(Connection conn, int fid) {
		// deleteAttachment=UPDATE ATTACHMENT SET STATUS='N' WHERE REF_FNO=?
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fid);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int mgetListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("mgetListCount");

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

	public ArrayList<FAQ> mselectList(Connection conn, PageInfo pi) {
		ArrayList<FAQ> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("mselectList");

		//mselectList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM 
		//(SELECT FAQ_NO, FCATE_NAME, FAQ_TITLE, MEM_NAME, CREATE_DATE, STATUS 
		//FROM FAQ F JOIN FAQ_CATEGORY USING(FCATE_NO) JOIN MEMBER USING(MEM_NO) 
		//WHERE F.STATUS IN ('Y', 'N') ORDER BY FAQ_NO DESC) A) WHERE RNUM BETWEEN ? AND ?

		int startRow = (pi.getCurrentPage() - 1) * pi.getFAQLimit() + 1;
		int endRow = startRow + pi.getFAQLimit() - 1;

		/*
		 * currentPage 1, startRow = 1, endRow = 10; currentPage 2, startRow = 11,
		 * endRow = 20; currentPage 3, startRow = 21, endRow = 30;
		 */

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			//FAQ_NO, FCATE_NAME, FAQ_TITLE, MEM_NAME, CREATE_DATE, STATUS 
			while (rset.next()) {
				list.add(new FAQ(
						rset.getInt("FAQ_NO"), 
						rset.getString("FCATE_NAME"),
						rset.getString("FAQ_TITLE"), 
						rset.getString("MEM_NAME"), 
						rset.getDate("CREATE_DATE"),
						rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertAnswer(Connection conn, Answer a) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAnswer");
		// insertAnswer=INSERT INTO ANSWER VALUES(
		// SEQ_ANSNO.NEXTVAL, ?, ?, ?, SYSDATE, DEFAULT)

		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a.getRefFAQno());
			pstmt.setString(2, a.getAnsWriter());
			pstmt.setString(3, a.getAnsContent());
				
			result += pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Answer> selectAnswer(Connection conn, int fno) {
		ArrayList<Answer> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnswer");
		// selectAnswer=SELECT ANS_NO, ANS_CONTENT, MEM_NAME, CREATE_DATE 
		// FROM ANSWER A JOIN MEMBER USING(MEM_NO) WHERE REF_FNO=? 
		// AND A.STATUS='Y' ORDER BY ANS_NO DESC
		System.out.println("Answerfno --->"+fno);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			list = new ArrayList<Answer>();
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Answer(rset.getInt("ANS_NO"),
									rset.getString("ANS_CONTENT"),
									rset.getString("MEM_NAME"),
									rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateStatus(Connection conn, int fno) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateStatus");
		// UPDATE FAQ SET STATUS='Y' WHERE FAQ_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
