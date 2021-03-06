package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class MemberPwdFindServlet
 */
@WebServlet("/findMemberPwd.do")
public class MemberPwdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPhone = request.getParameter("userPhone");
		
		int result = new MemberService().findMemberPwd(userId, userPhone);
		
		RequestDispatcher view = null;
		
		if(result > 0) {
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("views/member/pwdUpdateForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "조회 실패하였습니다.");
			view = request.getRequestDispatcher("views/common/errorPopup.jsp");
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
