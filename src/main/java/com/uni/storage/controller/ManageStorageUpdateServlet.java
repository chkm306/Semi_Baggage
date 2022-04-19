package com.uni.storage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.storage.model.service.StorageService;

/**
 * Servlet implementation class ManageStorageUpdateServlet
 */
@WebServlet("/updateStorage.do")
public class ManageStorageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageStorageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int storageNo = Integer.parseInt(request.getParameter("storageNo"));
		String storageName = request.getParameter("storageName");
		String storageAddress = request.getParameter("storageAddress");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int result = new StorageService().updateStorage(storageNo, storageName, storageAddress);
		
		RequestDispatcher view = null;
		
		if(result > 0) {
			request.setAttribute("loginUser", loginUser);
			view = request.getRequestDispatcher("views/member/myPageDetail.jsp");
		} else {
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
