package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginMember.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		// login.jsp에서 받아온 userId, userPwd 가져오기
		
		String originPwd = request.getParameter("userPwd");
		// 패스워드 저장
		System.out.println("originPwd: " + originPwd);
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		System.out.println("loginUser" + loginUser);
		// 로그인한 회원 정보를 Service에서 가져온 뒤 loginUser에 저장
		
		if(loginUser != null) { // login이 성공적이면
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("originPwd", originPwd);
			// session에 로그인 정보와 originPwd를 저장해 준다

			response.sendRedirect(request.getContextPath());
			// 메인 페이지 가져오기
			// 수정 필요
			
		} else { // login 실패
			request.setAttribute("msg", "로그인에 실패하였습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			// 로그인 실패하면 msg를 담아서 에러 페이지로 이동한다
			
			view.forward(request, response);
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
