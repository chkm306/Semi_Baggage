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
 * Servlet implementation class TipListServelet
 */
@WebServlet("/tipList.do")
public class TipListServelet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TipListServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Board b = new Board(1, "title", "category", "content", "2012-02-03", 1);
		ArrayList<Board> bList = new ArrayList<Board>();
		//bList.add(b);
		
		request.setAttribute("bList", bList);
		 
		RequestDispatcher view = request.getRequestDispatcher("views/board/tipListView.jsp");
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
