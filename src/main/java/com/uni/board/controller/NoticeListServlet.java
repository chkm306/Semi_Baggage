package com.uni.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.dto.Board;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/listNotice.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int listCount;
		int currentPage;
		int startPage;
		int endPage;
		
		int maxPage;
		int pageLimit;
		int noticeLimit;
		
		listCount = new noticeService().getListCount();
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			
		}
		*/
		
		//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
		Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
		ArrayList<Board> bList = new ArrayList<Board>();
		bList.add(b);
		
		request.setAttribute("bList", bList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/board/noticeListPage.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
