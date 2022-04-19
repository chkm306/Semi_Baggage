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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/updateFormBoardform.do")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		Board_Info b = new BoardService().selectBoard(b_no);
		ArrayList<Board_content> bList = new BoardService().selectBoardList(b_no);
		
		request.setAttribute("bList", bList);
		request.setAttribute("b", b);
		request.setAttribute("b_no", b_no);
		RequestDispatcher view = request.getRequestDispatcher("/views/board/updateBoardForm.jsp");
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
