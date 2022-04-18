package com.uni.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.faq.model.dto.Answer;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.service.FAQService;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class AnswerInsertServlet
 */
@WebServlet("/insertAnswer.do")
public class AnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = request.getParameter("content");
		int fno = Integer.parseInt(request.getParameter("fno"));
		String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Answer a = new Answer();
		a.setAnsContent(content);
		a.setRefFAQno(fno);
		a.setAnsWriter(writer);
		
		int result1 = new FAQService().insertAnswer(a);
		
		int result2 = new FAQService().updateStatus(fno);
		
		PrintWriter out = response.getWriter();
		if(result1 > 0 && result2 > 0){
			out.print("답변 등록 완료");
			request.setAttribute("msg", "답변을 성공적으로 등록했습니다.");
			response.sendRedirect("detailFAQ.do?fno=" + fno);
		}else {
			out.print("답변 등록 실패");
			request.setAttribute("msg", "답변을 등록하는데 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
