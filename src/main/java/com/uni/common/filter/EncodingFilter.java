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

/**
 * Servlet Filter implementation class EncodingFilter
 */
//@WebFilter("/*")
//post 요청할 때는 항상 실행한다
// web.xml에서 호출해 줄 것이기 때문에 주석 처리

// request: 웹 브라우저(클라이언트)를 통해 서버에 요청하는 것
// 서버에 요청하는 정보가 Request 객체에 담긴다
// response: 서버에서 웹 브라우저(클라이언트)에 응답하는 것
// 응답의 정보가 Response 객체에 담기게 된다

public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
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
		System.out.println("=== 인코딩 필터 동작 start ===");
		// 필터 시작하는 것을 알려 주는 메시지 출력
		
		// Method 방식이 post면 UTF-8 인코딩을 해 준다
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) { 
			System.out.println("=== post 방식이 요청됨 ===");
			request.setCharacterEncoding("UTF-8"); // UTF-8 인코딩
		}
		
		chain.doFilter(request, response); // 필터 실행 전, 후 구분
		
		System.out.println("=== 서블릿 동작하고 나서 실행 ===");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
