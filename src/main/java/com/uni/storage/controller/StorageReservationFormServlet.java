package com.uni.storage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.storage.model.dto.Storage;
import com.uni.storage.model.service.StorageService;

/**
 * Servlet implementation class StorageReservationFormServlet
 */
@WebServlet("/reservationStorageForm.do")
public class StorageReservationFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorageReservationFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sr_sno = Integer.parseInt(request.getParameter("sno"));
		System.out.println("값 출력: " + sr_sno);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		Storage storage = new StorageService().selectStorage(sr_sno);
		
		System.out.println("쥬소" + storage.getSto_address());
		
		if(storage != null) {
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("storage", storage);
			request.getRequestDispatcher("views/storage/storageReservationForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "조회 실패하였습니다.");
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
