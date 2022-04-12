package com.uni.board.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.board.model.dao.NoticeDao;
import com.uni.board.model.dto.Board;

public class NoticeService {

	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		ArrayList<Board> bList = new NoticeDao().selectList(conn);
		 
		for(Board b : bList) {
			System.out.println("service : " + b.getbTitle());
		}
		
		return bList;
	}

	public Board selectNotice(int bno) {
		Connection conn = getConnection();
		Board notice = new NoticeDao().selectNotice(bno, conn);
		return notice;
	}

}
