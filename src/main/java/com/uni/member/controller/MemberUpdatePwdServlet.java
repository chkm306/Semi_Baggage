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
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		// userId를 받아와서 비밀번호 변경을 해 줘야 되기 때문에 session에서 loginUser를 받아온 뒤 getUserId()
		
		// 암호화하는 servlet이기 때문에 EncryptFilter 적용
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String originPwd = (String)request.getAttribute("userPwd"); // 비교하기 위한 값
		
		// MemberService에서 updatePwd 호출
		Member updateMem = new MemberService().updatePwd(userId, userPwd, newPwd);
		
		// RequestDispatcher로 지정한 경로로 이동
		RequestDispatcher view = request.getRequestDispatcher("views/member/pwdUpdateForm.jsp");
		
		// updateMem이 성공적이라면
		if(updateMem != null) {
			request.setAttribute("sTag", "Y");
			request.setAttribute("msg", "성공적으로 비밀번호를 변경하였습니다.");
			// session 로그인 정보에 수정된 updateMem을 넣어 준다 
			request.getSession().setAttribute("loginUser", updateMem);
			request.getSession().setAttribute("originPwd", originPwd);
		} else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
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
