package com.uni.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.notice.model.dto.Notice;
import com.uni.notice.model.dto.Notice;
import com.uni.notice.model.service.NoticeService;

/** 
 * Servlet implementation class noticeDetailServlet
 */
@WebServlet("/detailNotice.do")
public class noticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeDetailServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("noticeDetail servlet 실행됨");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Notice notice = new NoticeService().selectNotice(bno); 
		
		String view = "";
		
		if(notice != null) {
			request.setAttribute("notice", notice);
			view = "views/notice/noticeDetailPage.jsp";
		} else {
			request.setAttribute("msg", "공지사항 조회에 실패했습니다.");
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
