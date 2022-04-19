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
 * Servlet implementation class BoardUpdateInfo
 */
@WebServlet("/boardUpdateInfo.do")
public class BoardUpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("BoardUpdateInfo servlet install");
		System.out.println();
		
		if(ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;
			
			String resource = request.getSession().getServletContext().getRealPath("/resources");
			System.out.println(resource);
			String savePath = resource + "\\board_Uploard\\";
			System.out.println(savePath);


			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			
			int b_no = Integer.parseInt(request.getParameter("b_no"));
			System.out.println();
			System.out.println(b_no);
			System.out.println();
			String title = multiRequest.getParameter("title");
			int category = Integer.parseInt(multiRequest.getParameter("category"));
			System.out.println(category);

				
			String origin = multiRequest.getOriginalFileName("upfile");
			System.out.println(origin);

			String change = multiRequest.getFilesystemName("upfile");
			System.out.println(change);

			
			Board_Info b = new Board_Info(b_no, title, category, origin, change, savePath);
			
			int result = new BoardService().updateBoard(b);
			
			request.setAttribute("b_no", b_no);


			
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
