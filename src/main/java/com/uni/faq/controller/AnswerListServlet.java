package com.uni.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.faq.model.dto.Answer;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.service.FAQService;

/**
 * Servlet implementation class AnswerListServlet
 */
@WebServlet("/answerList.do")
public class AnswerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		ArrayList<Answer> a = new FAQService().selectAnswer(fno);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		new Gson().toJson(a, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
