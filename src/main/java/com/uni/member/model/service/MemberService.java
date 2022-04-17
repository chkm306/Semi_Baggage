package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.dto.Member;

public class MemberService {

	public int insertMember(Member mem) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection(); // sql 연결
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		// MemberDao에 연결해서 loginUser 값 가져오기
		
		close(conn);
		return loginUser;
	}
	
	public Member selectMember(String userId) {
		Connection conn = getConnection(); // sql 연결
		Member member = new MemberDao().selectMember(conn, userId);
		
		close(conn);
		return member;
	}

	public int updatePwd(String userId, String newPwd) {
		Connection conn = getConnection();
		// 수정될 정보를 담을 객체
		Member updateMem = null;
		
		// MemberDao에 있는 updatePwd를 호출한 뒤 결과값 반환
		int result = new MemberDao().updatePwd(conn, userId, newPwd);
		
		if(result > 0) { // 성공적으로 수정되었으면
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public String findMember(String userName, String userPhone) {
		Connection conn = getConnection();
		
		String userId = new MemberDao().findMember(conn, userName, userPhone);
		
		close(conn);
		return userId;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		close(conn);
		return result;
	}

	public Member updateMember(String userId, String userName, String userPhone, String userEmail) {
		Connection conn = getConnection();
		
		Member updateMem = null;
		int result = new MemberDao().updateMember(conn, userId, userName, userPhone, userEmail);
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		} else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int findMemberPwd(String userId, String userPhone) {
		Connection conn = getConnection();
		
		int result = new MemberDao().findMemberPwd(conn, userId, userPhone);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Member> selectMemberList() {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectMemberList(conn);
		
		close(conn);
		return list;
	}

	public int deleteManageMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteManageMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

}
