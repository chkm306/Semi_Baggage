package com.uni.faq.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.MyFileRenamePolicy;
import com.uni.faq.model.dto.Attachment;
import com.uni.faq.model.dto.FAQ;
import com.uni.faq.model.service.FAQService;

/**
 * Servlet implementation class FAQUpdateServlet
 */
@WebServlet("/updateFAQ.do")
public class FAQUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;

			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\upFiles\\FAQ\\";
			System.out.println("savePath " + savePath);

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			int fno = Integer.parseInt(multiRequest.getParameter("fno"));

			FAQ f = new FAQ();
			
			f.setFaqTitle(multiRequest.getParameter("title"));
			f.setFaqContent(multiRequest.getParameter("content"));
			f.setFaqCategory(multiRequest.getParameter("category"));
			f.setFaqNo(fno);

			Attachment at = null;

			if (multiRequest.getOriginalFileName("upFile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upFile"));
				at.setChangeName(multiRequest.getFilesystemName("upFile"));
				at.setFilePath(savePath);

				if (multiRequest.getParameter("originFile") != null) {
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
					deleteFile.delete();

					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));

				} else {
					at.setRefFAQNo(fno);
				}
			}

			int result = new FAQService().updateFAQ(f, at);

			if (result > 0) {
				request.setAttribute("msg", "문의글을 성공적으로 수정했습니다.");
				response.sendRedirect("detailFAQ.do?fno=" + fno);
			} else {
				request.setAttribute("msg", "문의글을 수정하는데 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
