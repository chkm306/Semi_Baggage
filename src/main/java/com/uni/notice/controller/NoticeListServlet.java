package com.uni.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.notice.model.dto.Notice;
import com.uni.notice.model.dto.PageInfo;
import com.uni.notice.model.service.NoticeService;

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
		
		int listCount; // 총 게시글 갯수
		int currentPage; // 현재 페이지(요청한 페이지)
		int startPage; // 현재 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage; // 현재 페이지 하단에 보여지는 페이징 바의 끝 수
		  
		int maxPage; // 전체 페이지의 가장 마지막 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 갯수
		int noticeLimit; //한 페이지에 보여질 게시글 최대 갯수
		  
		listCount = new NoticeService().getListCount();
		  
		currentPage = 1;
		  
		if(request.getParameter("currentPage") != null) {
		    currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		  
		pageLimit = 10;
		
		noticeLimit = 10;
		  
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		  
		endPage = startPage + pageLimit - 1;
		  
		if(maxPage < endPage) {
		   endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, noticeLimit);
		
		
		//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
		//Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
		ArrayList<Notice> bList = new NoticeService().selectList(pi);
		//bList.add(b);
		
		request.setAttribute("bList", bList);
		request.setAttribute("pi", pi);

		request.getRequestDispatcher("views/notice/noticeListPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
