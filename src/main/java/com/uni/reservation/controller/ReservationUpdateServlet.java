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
 * Servlet implementation class ReservationUpdateServlet
 */
@WebServlet("/reservationUpdate.do")
public class ReservationUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int res_no = Integer.parseInt(request.getParameter("res_no"));
		
		Reservation r = new Reservation();
		r.setBaggage(request.getParameter("baggage"));           
		r.setAmount(Integer.parseInt(request.getParameter("amount"))); 
		r.setSta_place(request.getParameter("sta_place"));
		r.setSta_date(request.getParameter("sta_date"));
		r.setSta_time(request.getParameter("sta_time"));
		r.setArr_place(request.getParameter("arr_place"));
		r.setArr_time(request.getParameter("arr_time"));
		
		int result = new ReservationService().updateReservation(r);
		
	
			if(result > 0) {//받아온 값이 null이 아니면
					request.setAttribute("msg","성공적으로 예약정보를 수정하였습니다."); 
					response.sendRedirect("reservationDetail.do");// 프로젝트 Path만 가져옴.
																	

				}else {
					request.setAttribute("msg","예약 정보 수정에 실패하였습니다");
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");////응답할 뷰 선택
					//RequestDispatcher : 현재 request에 담긴 정보를 저장하고 있다가 그 다음 페이지에서도 해당정보를 볼수 있게 저장하는 기능
					
					view.forward(request, response); //request와 response를 위의 경로로 넘겨줌.
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
