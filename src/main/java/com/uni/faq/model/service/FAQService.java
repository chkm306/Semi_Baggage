package com.uni.faq.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.faq.model.dao.FAQDao;
import com.uni.faq.model.dto.Answer;
import com.uni.faq.model.dto.Attachment;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.dto.PageInfo;

public class FAQService {
	
	public int getListCount(String userId) {
		Connection conn = getConnection();

		int listCount = new FAQDao().getListCount(conn, userId);
		close(conn);
		return listCount;
	}
	
	public ArrayList<FAQ> selectList(String userId, PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<FAQ> list = new FAQDao().selectList(conn, userId, pi);
		close(conn);
		return list;
	}

	public int insertFAQ(FAQ f, Attachment at) {
		Connection conn = getConnection();

		int result1 = new FAQDao().insertFAQ(conn, f);
		int result2 = 1;

		if (at != null) {
			result2 = new FAQDao().insertAttachment(conn, at, f);
		}
		if (result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
//	public ArrayList<FAQ> selectList(PageInfo pi) {
//		Connection conn = getConnection();
//
//		ArrayList<FAQ> list = new FAQDao().selectList(conn, pi);
//		close(conn);
//		return list;
//	}
	
	public FAQ selectFAQ(int fno) {
		Connection conn = getConnection();
		
		FAQ f = new FAQDao().selectFAQ(conn, fno);
		
		close(conn);
		return f;
	}
		// 상관은 없지만 굳이 필요한가
//		int result = new FAQDao().increaseCount(conn, fno);
//		FAQ f = null;

//		if (result > 0) {
//			commit(conn);
//			f = new FAQDao().selectFAQ(conn, fno);
//		} else {
//			rollback(conn);
//		}
//		close(conn);
//		return f;
//	}
	
	public FAQ selectUpdateFAQ(int fno) {
		Connection conn = getConnection();

		FAQ f = new FAQDao().selectFAQ(conn, fno);

		close(conn);
		return f;
	}
	
	public int updateFAQ(FAQ f, Attachment at) {
		Connection conn = getConnection();

		int result1 = new FAQDao().updateFAQ(conn, f);
		int result2 = 1;

		if (at != null) {
			if (at.getFileNo() != 0) {
				result2 = new FAQDao().updateAttachment(conn, at);
			} else {
				result2 = new FAQDao().insertNewAttachment(conn, at, f);
			}
		}
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	
	public int deleteFAQ(int fno) {
		Connection conn = getConnection();

		int result1 = new FAQDao().deleteFAQ(conn, fno);
		int result2 = 1;
		
		Attachment at = new FAQDao().selectAttachment(conn, fno);
		
		if (at != null) {
			result2 = new FAQDao().deleteAttachment(conn, fno);
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result1 * result2;
	}

	public Attachment selectAttachment(int fno) {
		Connection conn = getConnection();

		Attachment at = new FAQDao().selectAttachment(conn, fno);
		close(conn);
		return at;
	}

	public int mgetListCount() {
		Connection conn = getConnection();

		int listCount = new FAQDao().mgetListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<FAQ> mselectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<FAQ> list = new FAQDao().mselectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertAnswer(Answer a) {
		Connection conn = getConnection();

		int result = new FAQDao().insertAnswer(conn, a);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Answer> selectAnswer(int fno) {
		Connection conn = getConnection();
		
		ArrayList<Answer> list = new FAQDao().selectAnswer(conn, fno);
		close(conn);
		return list;
	}

	public int updateStatus(int fno) {
		Connection conn = getConnection();

		int result = new FAQDao().updateStatus(conn, fno);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
}
