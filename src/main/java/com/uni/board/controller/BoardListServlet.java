package com.uni.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.dto.Board_Info;
import com.uni.board.model.dto.PageInfo;
import com.uni.board.model.service.BoardService;



/** 
 * Servlet implementation class ColummListServlet
 */
@WebServlet("/listBoard.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("ColummListServlet install");
		System.out.println();

		int listCount; // 총 게시글 갯수
		int currentPage; // 현재 페이지(요청한 페이지)
		int startPage; // 현재 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage; // 현재 페이지 하단에 보여지는 페이징 바의 끝 수
		  
		int maxPage; // 전체 페이지의 가장 마지막 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit; //한 페이지에 보여질 게시글 최대 갯수
		  
		listCount = new BoardService().getListCount();
		System.out.println("listCount : " + listCount);
		  
		currentPage = 1;
		  
		if(request.getParameter("currentPage") != null) {
		    currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		  
		pageLimit = 10;
		
		boardLimit = 9;
		  
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		  
		endPage = startPage + pageLimit - 1;
		  
		if(maxPage < endPage) {
		   endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
		
		//ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
		//Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
		int category = 1;

		ArrayList<Board_Info> bList = new BoardService().selectList(pi, category);
		//bList.add(b);
		
		
		request.setAttribute("bList", bList);
		request.setAttribute("pi", pi);
		request.setAttribute("category", 1);
		RequestDispatcher view = request.getRequestDispatcher("views/board/BoardListView.jsp");
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
