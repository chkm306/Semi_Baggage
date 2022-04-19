package com.uni.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.reservation.model.dto.Reservation;
import com.uni.reservation.model.service.ReservationService;

/**
 * Servlet implementation class resInsertServlet
 */
@WebServlet("/insertReservation.do")
public class resInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String res_type = request.getParameter("res_type");						//구분
		String baggage = request.getParameter("baggage");						//짐 종류
		int amount = Integer.parseInt(request.getParameter("amount"));	//수량
		String sta_place = request.getParameter("sta_place");						//출발장소
		String sta_date = request.getParameter("sta_date");							//출발날짜
		String sta_time = request.getParameter("sta_time");						//출발시간
		String arr_place = request.getParameter("arr_place");						//도착장소
		String arr_time = request.getParameter("arr_time");							//도착시간
		
		Reservation r = new Reservation();
//		r.setRes_no(); 시퀀스 처리
		r.setMem_no(userNo);
		r.setRes_type(res_type);
		r.setBaggage(baggage);
		r.setAmount(amount);
		r.setSta_place(sta_place);
		r.setSta_date(sta_date);
		r.setSta_time(sta_time);
		r.setArr_place(arr_place);
		r.setArr_time(arr_time);
//		r.setStatus(); 디폴트처리
//		f.setMemNo(String.valueOf(userNo));
		
		
		int result = new ReservationService().insertRes(r);
		response.sendRedirect("listReserve.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
