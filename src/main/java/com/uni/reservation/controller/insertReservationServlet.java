package com.uni.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.reservation.model.dto.Reservation;
import com.uni.reservation.model.service.ReservationService;

/**
 * Servlet implementation class insertReservation
 */
@WebServlet("/insertReservation.do")
public class insertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");// 한글처리
		
		String res_type = request.getParameter("res_type");
		String baggage = request.getParameter("baggage");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String sta_place = request.getParameter("sta_place");
		String sta_date = request.getParameter("sta_date");
		String sta_time = request.getParameter("sta_time");
		String arr_place = request.getParameter("arr_place");
		String arr_time = request.getParameter("arr_time");
		
		
		Reservation r = new Reservation(res_type, baggage, amount, sta_place, sta_date, sta_time, arr_place, arr_time);
		
		int result = new ReservationService().insertReservation(r);
		
		if(result > 0) {
			request.getSession().setAttribute("msg","예약성공");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "예약실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
