package com.uni.board.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.board.model.dao.NoticeDao;
import com.uni.board.model.dto.Board;
import com.uni.board.model.dto.PageInfo;

public class NoticeService {  

	/*
	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		ArrayList<Board> bList = new NoticeDao().selectList(conn);
		 
		for(Board b : bList) {
			System.out.println("service : " + b.getbTitle());
		}
		
		return bList;
	}
	*/
	public Board selectNotice(int bno) {
		System.out.println("selectNotice service 실행됨");

		Board notice = null;
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, bno);
		System.out.println("selectNotice service result : " + result);


		
		if(result > 0) {
			commit(conn);
			notice = new NoticeDao().selectNotice(bno, conn);

		} else {
			rollback(conn);

		}
		System.out.println("selectNotice" + notice);
		return notice;
	}
	
	public Board getNotice(int bno) {
		System.out.println("getNotice service 실행됨");
		Connection conn = getConnection();

		Board notice = new NoticeDao().selectNotice(bno, conn);

		return notice;
	}

	public int getListCount() {
		System.out.println("getListCount service 실행됨");

		Connection conn = getConnection();
		int listCount = new NoticeDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		System.out.println("selectList service 실행됨");

		Connection conn = getConnection();
		ArrayList<Board> bList = new NoticeDao().selectList(conn, pi);
		close(conn);
		return bList;
	}

	public int insertNotice(String title, String content) {
		System.out.println("insertNotice service 실행됨");
		System.out.println(title);
		System.out.println(content);

		Connection conn = getConnection();
		int lastNum = new NoticeDao().lastNum(conn);
		int result = new NoticeDao().insertNotice(title, content, lastNum,  conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteNotece(int bno) {
		System.out.println("deleteNotece service 실행됨");

		Connection conn = getConnection();		
		int result = new NoticeDao().deleteNotice(bno, conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Board updateNotice(int bno, String title, String content) {
		System.out.println("updateNotice service 실행됨");
		Board notice = null;

		Connection conn = getConnection();		
		int result = new NoticeDao().updateNotice(bno, title, content, conn);
		if(result > 0) {
			commit(conn);
			notice = new NoticeDao().selectNotice(bno, conn);
		} else {
			rollback(conn);
		}
		System.out.println("update : "+ notice);
		return notice;
	}

}
