package com.uni.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class ManageDeletePopupServlet
 */
@WebServlet("/mgDeletePopup.do")
public class ManageDeletePopupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageDeletePopupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		int result = new MemberService().deleteManageMember(userId);
		
		if(result > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>opener.parent.location.reload(); window.close();</script>");
			out.flush();
		} else {
			request.getSession().setAttribute("msg", "회원 삭제를 실패하였습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPopup.jsp");
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
