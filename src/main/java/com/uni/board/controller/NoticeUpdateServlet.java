package com.uni.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.dto.Board;
import com.uni.board.model.service.NoticeService;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/updateNotice.do")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println(bno);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board notice = new NoticeService().updateNotice(bno, title, content.replace("\n", "<br>"));
		
		if(notice != null) {
			request.setAttribute("msg", "공지사항 수정 되었습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/board/noticeDetailPage.jsp");
			request.setAttribute("notice", notice);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "공지사항 수정 실패했습니다.");
			System.out.println(notice);
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
