package com.uni.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.faq.model.dto.Attachment;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.service.FAQService;

/**
 * Servlet implementation class faqDetailServlet
 */
@WebServlet("/detailFAQ.do")
public class FAQDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		FAQ f = new FAQService().selectFAQ(fno);
		Attachment at = new FAQService().selectAttachment(fno);
		
		if (f != null) {
			request.setAttribute("f", f);
			request.setAttribute("at", at);
			
			System.out.println("fno ---------->"+fno);
			System.out.println("MemNo -------->"+f.getMemNo());
			System.out.println("at ----------->"+at);
			
			request.getRequestDispatcher("views/faq/faqDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "문의글 상세 조회에 실패했습니다.");
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
