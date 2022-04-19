package com.uni.storage.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.storage.model.dto.Storage;
import com.uni.storage.model.service.StorageService;

/**
 * Servlet implementation class StorageReservationServlet
 */
@WebServlet("/storageReservation.do")
public class StorageReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorageReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sto_no = Integer.parseInt(request.getParameter("sto_no"));
		String userNo = request.getParameter("userNo");
		
		Storage storage = new StorageService().selectStorage(sto_no);
		
		System.out.println(storage.toString());
		
		String reserveDate = request.getParameter("reserveDate");
		String recoverDate = request.getParameter("recoverDate");
		
		// Date형으로 포맷 맞추기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sr_start = null;
		Date sr_end = null;
		try {
			sr_start = new Date(sdf.parse(reserveDate).getTime());
			sr_end = new Date(sdf.parse(recoverDate).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int sr_sno = storage.getSto_no();
		String sr_address = storage.getSto_address();
		
		String sr_baggage = request.getParameter("baggageType");
		int sr_amont = Integer.parseInt(request.getParameter("baggageAmount"));
		
		Storage sr = new Storage(sr_sno, sr_address, userNo, sr_start, sr_end, sr_baggage, sr_amont);
		
		System.out.println(sr.toString());
		
		int result = new StorageService().insertStorageReserve(sr);
		
		Storage reserveInfo = new StorageService().selectStoRes(sr_sno, userNo);
	
		if(result > 0) {
			request.setAttribute("sr", reserveInfo);
			request.getRequestDispatcher("views/storage/storageReservationResult.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "예약 실패하였습니다.");
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
