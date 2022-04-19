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
import com.uni.board.model.dto.Board_Info;
import com.uni.board.model.service.BoardService;
import com.uni.common.wrapper.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insertBoard.do")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardInsertServlet servlet install");
		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("servlet install");

			int maxSize = 10 * 1024 * 1024;
			
			String resource = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resource + "\\board_Uploard\\";
			
			System.out.println("servlet install1");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			System.out.println("servlet install2");

			System.out.println("file : " + multiRequest.getOriginalFileName("upfile"));

			
			int b_no = new BoardService().getLastNum();
			System.out.println(b_no);
			String title = multiRequest.getParameter("title");
			int category = Integer.parseInt(multiRequest.getParameter("category"));
			System.out.println(category);

			
			String origin = multiRequest.getOriginalFileName("upfile");
			String change = multiRequest.getFilesystemName("upfile");
			
			Board_Info b = new Board_Info(b_no, title, category, origin, change, savePath);
			
			int result = new BoardService().insertBoard(b);
			

			
			if(result > 0) {
				request.getSession().setAttribute("msg", "게시물 등록 성공했습니다.");
				request.setAttribute("b_no", b_no);

				RequestDispatcher view = request.getRequestDispatcher("views/board/insertBoard_content.jsp");
				view.forward(request, response);
			} else {
				request.getSession().setAttribute("msg", "게시물 등록 실패했습니다.");
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
