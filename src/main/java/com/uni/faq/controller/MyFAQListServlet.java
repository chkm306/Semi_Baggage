package com.uni.faq.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.dto.PageInfo;
import com.uni.faq.model.service.FAQService;
import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class myFaqListServlet
 */
@WebServlet("/listMyFAQ.do")
public class MyFAQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyFAQListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		String userNo = loginUser.getUserNo();
		String userId = loginUser.getUserId(); // loginUser 안에 있는 String userId 가져오기

		// userId 를 가지고 Member 정보를 조회
		Member member = new MemberService().selectMember(userId);
		// 정보를 다시 조회 db에서 정보를 가져오기.

		System.out.println("member ----> " + member);
		System.out.println("userNo ----> " + userNo);
		System.out.println("userId ----> " + userId);

		// 페이징 처리
		int listCount = 0; // 총 게시글 갯수
		int currentPage; // 현재 페이지 (요청한 페이지)
		int startPage; // 현재 페이지에 하단에 보여지는 페이징 바의 시작 수
		int endPage; // 현재 페이지에 하단에 보여지는 페이징 바의 끝 수

		int maxPage; // 전체 페이지에서의 가장 마지막 페이지
		int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 갯수
		int FAQLimit; // 한 페이지에 보여질 게시글 최대 갯수
		ArrayList<FAQ> list = null;
		
		
		if (member != null) {
			request.setAttribute("loginUser", member);
			
			// 총 게시글 갯수
			if (member.getUserType() == 1 || member.getUserType() == 2) {
				listCount = new FAQService().getListCount(userNo);
			} else if (member.getUserType() == 3) {
				listCount = new FAQService().mgetListCount();
			}
			
			// 현재 페이지 (요청한 페이지)
			currentPage = 1;

			// 페이지 전환 시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage에 담기
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			// 한 페이지 하단에 보여질 페이지 최대 갯수
			pageLimit = 10;

			// 한 페이지에 보여질 게시글 최대 갯수
			FAQLimit = 10;

			// * maxPage : 총 페이지 수
			maxPage = (int) Math.ceil((double) listCount / FAQLimit);

			// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

			// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
			endPage = startPage + pageLimit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, FAQLimit);
			
			if (member.getUserType() == 1 || member.getUserType() == 2) {
				list = new FAQService().selectList(userNo, pi);
			} else if (member.getUserType() == 3) {
				list = new FAQService().mselectList(pi);
			}
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/faq/myFAQListView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
