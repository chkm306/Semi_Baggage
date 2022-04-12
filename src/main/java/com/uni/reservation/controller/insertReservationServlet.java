package com.uni.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.reservation.model.dto.Reservation;

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
		
//		Reservation r = new Reservation();
//		
//		
//		r.setBaggage(request.getParameter("baggage"));
//		r.setAmount(Integer.parseInt(request.getParameter("amount")));
//		r.setSta_place(request.getParameter("sta_place"));
//		r.setSta_date(request.getParameter("sta_date"));
//		r.setSta_time(request.getParameter("sta_time"));
//		r.setArr_place(request.getParameter("arr_place"));
//		r.setArr_time(request.getParameter("arr_time"));
//		
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/reservation/DetailReservation.jsp");
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
