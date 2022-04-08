package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class MemberPageServlet
 */
@WebServlet("/listMyPage.do")
public class MemberPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		// 로그인 정보 세션에서 가져오기
		String userId = loginUser.getUserId();
		// loginUser에서 userId 가져오기
		
		Member member = new MemberService().selectMember(userId);
		
		RequestDispatcher view = null;
		
		if(member != null) { // 일치하는 정보가 있으면
			request.setAttribute("loginUser", member);
			view = request.getRequestDispatcher("views/member/myPageDetail.jsp");
			// 위에서 저장한 member를 myPage에 넘겨준다
		} else { // 일치하는 정보가 없으면
			request.setAttribute("msg", "조회 실패하였습니다");
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
