package com.uni.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.board.model.dto.Board_content;
import com.uni.board.model.service.BoardService;
import com.uni.common.wrapper.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateContentServlet
 */
@WebServlet("/boardUpdateContent.do")
public class BoardUpdateContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateContentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("BoardInsertContentsServlet servlet install");
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("servlet install");

			int maxSize = 10 * 1024 * 1024;
			
			String resource = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resource + "\\board_Uploard\\";
			

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int b_no = Integer.parseInt(multiRequest.getParameter("b_no"));
			
			String content = multiRequest.getParameter("content");
			
			int order = Integer.parseInt(multiRequest.getParameter("order"));
	
			String origin = multiRequest.getOriginalFileName("upfile");
			String change = multiRequest.getFilesystemName("upfile");
			
			Board_content b = new Board_content(b_no, content.replace("\n", "<br>"), order, origin, change, savePath);
			
			int result = new BoardService().updateBoardContent(b);
			
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "게시물 수정 성공했습니다.");
				response.sendRedirect("listBoard.do");

			} else {
				request.getSession().setAttribute("msg", "게시물 수정 실패했습니다.");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
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
