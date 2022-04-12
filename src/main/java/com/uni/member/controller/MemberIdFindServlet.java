package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class MemberIdFindServlet
 */
@WebServlet("/findMemberId.do")
public class MemberIdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		// login.jsp에서 받아온 userName, userPhone 가져오기
		
		String userId = new MemberService().findMember(userName, userPhone);
		
		System.out.println(userId);
		RequestDispatcher view = null;
		if(!userId.equals("")) {
			request.setAttribute("userId", userId);
			request.setAttribute("userName", userName);
			view = request.getRequestDispatcher("views/member/findIdResultPopup.jsp");
		} else {
			request.setAttribute("msg", "조회 실패하였습니다.");
			view = request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		
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
