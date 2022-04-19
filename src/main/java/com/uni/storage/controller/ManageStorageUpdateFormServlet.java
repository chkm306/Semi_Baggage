package com.uni.storage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.storage.model.dto.Storage;
import com.uni.storage.model.service.StorageService;

/**
 * Servlet implementation class ManageStorageUpdateFormServlet
 */
@WebServlet("/manageStorageUpdateForm.do")
public class ManageStorageUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageStorageUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sto_no = Integer.parseInt(request.getParameter("sto_no"));
		
		Storage storage = new StorageService().selectStorage(sto_no);
		
		if(storage != null) {
			request.setAttribute("storage", storage);
			request.getRequestDispatcher("views/storage/manageStorageUpdate.jsp").forward(request, response);
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
