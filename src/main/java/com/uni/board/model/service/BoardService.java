package com.uni.board.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.board.model.dao.BoardDao;
import com.uni.board.model.dto.Board_Info;
import com.uni.board.model.dto.Board_content;
import com.uni.board.model.dto.PageInfo;
import com.uni.notice.model.dao.NoticeDao;

public class BoardService {

	public ArrayList<Board_Info> selectList(PageInfo pi, int category) {
		Connection conn = getConnection();
		
		ArrayList<Board_Info> bList = new BoardDao().selectList(pi, conn, category);
		close(conn);
		
		
		return bList;
	}

	public int getListCount() {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();


		Connection conn = getConnection();
		int listCount = new BoardDao().getListCount(conn);
		close(conn);
		
		System.out.println();
		System.out.println("getListCount service listCount : " + listCount);
		System.out.println();
		return listCount;
	}

	public int getLastNum() {
		System.out.println();
		System.out.println("getLastNum service 실행됨");
		System.out.println();

		Connection conn = getConnection();
		int lastNum = new BoardDao().getlastNum(conn);
		close(conn);
		
		System.out.println();
		System.out.println("getLastNum service lastNum : " + lastNum);
		System.out.println();
		return lastNum;

	}

	public int insertBoard(Board_Info b) {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();

		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
			System.out.println("commit result : " + result);
		} else {
			rollback(conn);
			System.out.println("rollback result : " + result);

		}
		
		close(conn);
		
		System.out.println();
		System.out.println("insertBoard service result : " + result);
		System.out.println();
		return result;
	}

	public int getOrderNum(int b_no) {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();
		Connection conn = getConnection();
		int order = new BoardDao().getOrderNum(conn, b_no);
		
		close(conn);

		System.out.println();
		System.out.println("getOrderNum service order : " + order);
		System.out.println();
		return order;
	}

	public int insertContent(Board_content b) {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();

		Connection conn = getConnection();
		int result = new BoardDao().insertContent(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		System.out.println();
		System.out.println("insertContent service result : " + result);
		System.out.println();
		return result;
	}

	public Board_Info selectBoard(int b_no) {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();
		
		Connection conn = getConnection();
		
		Board_Info b = null;
		

		int result = new BoardDao().increaseCount(b_no, conn);
		
		if(result > 0) {
			b = new BoardDao().selectBoard(conn, b_no);

		}
		
		close(conn);
		
		System.out.println();
		System.out.println("selectBoard service b : " + result);
		System.out.println();
		return b;
	}

	public ArrayList<Board_content> selectBoardList(int b_no) {
		System.out.println();
		System.out.println("getListCount service 실행됨");
		System.out.println();	
		
		Connection conn = getConnection();
		ArrayList<Board_content> bList = new BoardDao().selectBoardList(conn, b_no);
		
		close(conn);
		return bList;
	}

	public int deleteBoard(int b_no) {
		System.out.println();
		System.out.println("deleteBoard service 실행됨");
		System.out.println();

		Connection conn = getConnection();	
		
		int result = 0;
		
		int listResult = new BoardDao().deleteBoardContent(b_no, conn);
		
		System.out.println("deleteBoard service listResult : " + listResult);
		System.out.println();
		int objResult = new BoardDao().deleteBoardInfo(b_no, conn);

		if(objResult > 0) {
			result = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		System.out.println();
		System.out.println("deleteBoard service result : " + result);
		System.out.println();
		return result;
	}

	public int updateBoard(Board_Info b) {
		System.out.println();
		System.out.println("updateBoard service 실행됨");
		System.out.println();

		Connection conn = getConnection();		
		
		int result = new BoardDao().updateBoard(b, conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateBoardContent(Board_content b) {
		System.out.println();
		System.out.println("updateBoardContent service 실행됨");
		System.out.println();

		Connection conn = getConnection();		
		
		int result = new BoardDao().updateBoardContent(b, conn);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
