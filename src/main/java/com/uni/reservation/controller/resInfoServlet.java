package com.uni.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.reservation.model.dto.Reservation;

/**
 * Servlet implementation class resInfoServlet
 */
@WebServlet("/R_Info.do")
public class resInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		
		String userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String res_type = request.getParameter("res_type");						//구분
		String baggage = request.getParameter("baggage");						//짐 종류
		int amount = Integer.parseInt(request.getParameter("amount"));	//수량
		String sta_place = request.getParameter("sta_place");						//출발장소
		String sta_date = request.getParameter("sta_date");							//출발날짜
		String sta_time = request.getParameter("sta_time");						//출발시간
		String arr_place = request.getParameter("arr_place");						//도착장소
		String arr_time = request.getParameter("arr_time");							//도착시간
		
		Reservation r = new Reservation(userNo, res_type, baggage, amount, sta_date, sta_place, arr_place, sta_time, arr_time);
		
		System.out.println(r);
		request.setAttribute("r", r);
		
		RequestDispatcher view = request.getRequestDispatcher("views/reservation/reservationInfo.jsp");
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
