package com.uni.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.service.FAQService;

/**
 * Servlet implementation class faqDetailServlet
 */
@WebServlet("/faqDetailServlet")
public class faqDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("fno"));
		
		FAQ faq = new FAQService().selectNotice(nno);
		
		String view = "";
		
		if (faq != null) {
			request.setAttribute("faq", faq);
			view = "views/notice/faqDetailView.jsp";
		} else {
			request.setAttribute("msg", "조회에 실패했습니다.");
			view = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(view).forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
