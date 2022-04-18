package com.uni.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.faq.model.service.FAQService;

/**
 * Servlet implementation class FAQDeleteServlet
 */
@WebServlet("/deleteFAQ.do")
public class FAQDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fno = Integer.parseInt(request.getParameter("fno"));
		int result = new FAQService().deleteFAQ(fno);
		
		if(result > 0) {
			request.setAttribute("msg", "문의글을 성공적으로 삭제했습니다.");
			response.sendRedirect("listMyFAQ.do");
		}else {
			request.setAttribute("msg", "문의글을 삭제하는데 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
