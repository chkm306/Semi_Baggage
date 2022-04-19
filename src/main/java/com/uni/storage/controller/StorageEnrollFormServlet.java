package com.uni.storage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.storage.model.service.StorageService;

/**
 * Servlet implementation class StorageEnrollFormServlet
 */
@WebServlet("/storageEnrollForm.do")
public class StorageEnrollFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorageEnrollFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		String storageAddress = request.getParameter("storageAddress");
		String storageName = request.getParameter("storageName");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new StorageService().insertStorage(userNo, storageAddress, storageName);
		
		if(result > 0) {
			request.setAttribute("loginUser", loginUser);
			request.getRequestDispatcher("views/member/myPageDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "보관소 등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
