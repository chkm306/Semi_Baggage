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
 * Servlet implementation class ReservationDeleteServlet
 */
@WebServlet("/reservationDelete.do")
public class ReservationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		
		int result = new ReservationService().deleteReservation(res_no);
		
		if(result > 0) {// 0보다 크면
			request.getSession().setAttribute("msg", "예약이 취소되었습니다.");
			response.sendRedirect("reservationDetail.do"); // 상세보기로 이동
		}else {
			request.setAttribute("msg", "삭제에 실패하였습니다");
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
