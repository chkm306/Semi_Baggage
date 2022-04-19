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
import com.uni.board.model.dto.Board_content;
import com.uni.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/detailBoard.do")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardDetailServlet servlet install");
		System.out.println();
		System.out.println("bno : " + request.getParameter("bno"));
		
		
		
		int b_no = Integer.parseInt(request.getParameter("bno"));
		System.out.println(b_no);
		
		Board_Info b = new BoardService().selectBoard(b_no);
		ArrayList<Board_content> bList = new BoardService().selectBoardList(b_no);
		
		System.out.println();
		System.out.println("BoardDetailServlet Object b : " + b);
		System.out.println();
		
		request.setAttribute("b", b);
		request.setAttribute("bList", bList);
		
		request.getRequestDispatcher("views/board/boardDetailPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
