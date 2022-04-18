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
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class FAQInsertServlet
 */
@WebServlet("/insertFAQ.do")
public class FAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드를 위한 라이브러리 : cos.jar
		if (ServletFileUpload.isMultipartContent(request)) {
			// enctype이 multipart/form-data로 잘 전송되어있으면 true

			// 1. 전송된 파일들을 처리할 작업 내용 (전송되는 파일의 용량 제한, 전달된 파일을 저장할 폴더 경로)

			// 1_1. 전송파일 용량 제한 (int maxSize)
//										: 10Mbyte로 제한  ([참고] cos.jar로 파일 업로드 시 최대 2기가(1.6)까지만 가능)
//								     	1Kbyte = 1024byte (킬로바이트)
//										1Mbyte = 1024Kbyte = 1024 * 1024 byte (메가바이트)
//										1Gbyte = 1024Mbyte = 1024 * 1024 * 1024 Byte (기가바이트)
//										10Mbyte = 10 * 1024 * 1024 byte

			int maxSize = 10 * 1024 * 1024;

			// 1-2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
			String resources = request.getSession().getServletContext().getRealPath("/resources");

			String savePath = resources + "\\upfiles\\FAQ\\";

			System.out.println("savePath " + savePath);

			// MultipartRequest multiRequest = new MultipartRequest(request, savePath,
			// maxSize, "UTF-8", new DefaultFileRenamePolicy());
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			System.out.println(multiRequest.getOriginalFileName("upfile"));
			System.out.println(multiRequest.getFilesystemName("upfile"));

			String category = multiRequest.getParameter("category");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");

			String userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();

			System.out.println("userNo ----------> "+userNo);

			FAQ f = new FAQ();
			f.setFaqCategory(category);
			f.setFaqTitle(title);
			f.setFaqContent(content);
			f.setMemNo(String.valueOf(userNo));

			Attachment at = null;

			if (multiRequest.getOriginalFileName("upfile") != null) {
				String originName = multiRequest.getOriginalFileName("upfile");
				String changeName = multiRequest.getFilesystemName("upfile");

				System.out.println("originName : " + originName);
				System.out.println("changeName : " + changeName);

				at = new Attachment();

				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
			}

			int result = new FAQService().insertFAQ(f, at);

			if (result > 0) {
				System.out.println("문의 등록 성공!!!!!!!!!!!!!!");
				request.getSession().setAttribute("msg", "문의글을 성공적으로 등록했습니다.");
				response.sendRedirect("listMyFAQ.do");
			} else {
				if (at != null) {
					File failedFile = new File(savePath + at.getChangeName());
					failedFile.delete();
				}
				request.setAttribute("msg", "문의글을 등록하는데 실패했습니다.");
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
