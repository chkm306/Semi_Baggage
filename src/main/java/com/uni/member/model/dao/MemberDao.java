package com.uni.member.model.dao;

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

import com.uni.member.model.dto.Member;

public class MemberDao {

	private Properties prop = new Properties();
	// properties 가져오기 위해서 설정해 주기
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		// member-query의 경로 저장
		
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
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember"); // query 불러오기
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			// 결과 출력해 주는 rset
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) { // pstmt로 넘겨준 값에 맞는 결과문이 있다면
				loginUser = new Member(rset.getString("MEM_NO"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_ID"),
						rset.getString("MEM_PWD"),
						rset.getString("MEM_EMAIL"), 
						rset.getDate("MEM_DATE"), 
						rset.getInt("MEM_TYPE"),
						rset.getString("MEM_PHONE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(loginUser + "없냐");
		return loginUser;
	}
	
	public Member selectMember(Connection conn, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // pstmt로 넘겨준 값에 맞는 결과문이 있다면
				member = new Member(rset.getString("MEM_NO"),
						rset.getString("MEM_NAME"),
						rset.getString("MEM_ID"),
						rset.getString("MEM_PWD"),
						rset.getString("MEM_EMAIL"), 
						rset.getDate("MEM_DATE"), 
						rset.getInt("MEM_TYPE"),
						rset.getString("MEM_PHONE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return member;
	}
	public int updatePwd(Connection conn, String userId, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		// UPDATE MEMBER SET USER_PWD=?, MODIFY_DATE=SYSDATE 
		// WHERE USER_ID=? AND USER_PWD=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public String findMember(Connection conn, String userName, String userPhone) {
		String userId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userId = rset.getString("MEM_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return userId;
	}
	public int insertMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		// INSERT INTO MEMBER 
		// VALUES(SEQ_MEM_NO.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getUserName());
			pstmt.setString(2, mem.getUserId());
			pstmt.setString(3, mem.getUserPwd());
			pstmt.setString(4, mem.getEmail());
			pstmt.setInt(5, mem.getUserType());
			pstmt.setString(6, mem.getPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}
	public int updateMember(Connection conn, String userId, String userName, String userPhone, String userEmail) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateMember");
		// UPDATE MEMBER SET USER_PWD=?, MODIFY_DATE=SYSDATE 
		// WHERE USER_ID=? AND USER_PWD=?
		System.out.println("정보: " + userId + userPhone + userEmail + userName);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int findMemberPwd(Connection conn, String userId, String userPhone) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}
	public ArrayList<Member> selectMemberList(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		/*
		 * MEM_NO
			MEM_NAME
			MEM_ID
			MEM_PWD
			MEM_EMAIL
			MEM_DATE
			MEM_TYPE
			MEM_PHONE	
		 */
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("MEM_NO"),
									rset.getString("MEM_NAME"),
									rset.getString("MEM_ID"),
									rset.getString("MEM_PWD"),
									rset.getString("MEM_EMAIL"),
									rset.getDate("MEM_DATE"),
									rset.getInt("MEM_TYPE"),
									rset.getString("MEM_PHONE")
									));
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
	public int deleteManageMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteManageMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
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
