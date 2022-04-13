package com.uni.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.uni.common.wrapper.EncryptWrapper;

/**
 * Servlet Filter implementation class EncryptFilter
 */
// @WebFilter("/EncryptFilter")
// @WebFilter(filterName = "encryptFilter", urlPatterns= {"/loginMember.do", "/updatePwdMember.do", "/insertMember.do"})
// web.xml에서 호출해 줄 것이기 때문에 주석 처리
// 암호화 필터
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if(request.getParameter("newPwd") == null) { // updatePwd.do를 제외한 서블릿에서 사용
			request.setAttribute("originPwd", request.getParameter("userPwd"));
			// originPwd에 받아온 userPwd 세팅
			System.out.println("변경 전 userPwd: " + request.getParameter("userPwd"));
		} else { // updatePwd.do에서 입력한 새로운 비밀번호 값 넣기
			request.setAttribute("originPwd", request.getParameter("newPwd"));
			// originPwd에 받아온 newPwd 세팅
			System.out.println("변경 전 newPwd: " + request.getParameter("newPwd"));
		}
		
		EncryptWrapper encRequest = new EncryptWrapper((HttpServletRequest)request);
		
		if(request.getParameter("newPwd") == null) {
			
			System.out.println("변경후 userPwd : "+ encRequest.getParameter("userPwd"));
		}else {
			
			System.out.println("변경후 newPwd : "+ encRequest.getParameter("newPwd"));
		}
		
		chain.doFilter(encRequest, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
