package com.uni.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdatePwdServlet
 */
@WebServlet("/updatePwdMember.do")
public class MemberUpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		
		// MemberService에서 updatePwd 호출
		int result = new MemberService().updatePwd(userId, userPwd, newPwd);
		
		response.setContentType("text/html; charset=euc-kr");
		
		if(result > 0) {
			PrintWriter writer = response.getWriter();
			String str = "";
			str = "<script>alert('비밀번호 재설정이 완료되었습니다');";
			str += "self.close();";
			str += "</script>";
			
			writer.print(str);
			writer.close();
		} else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
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
