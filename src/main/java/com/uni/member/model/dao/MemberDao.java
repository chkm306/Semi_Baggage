package com.uni.member.model.dao;

import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			// LoginServlet에서 가져온 userId, userPwd를 query에 입력해 준다
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
	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		// UPDATE MEMBER SET USER_PWD=?, MODIFY_DATE=SYSDATE 
		// WHERE USER_ID=? AND USER_PWD=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
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

}
