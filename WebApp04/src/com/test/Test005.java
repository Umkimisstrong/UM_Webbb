/* ================
     Test005.java
     - Servlet 실습
================ */

// 현재.. 자바의 기본 클래스 Test005
// 이를 Servlet 으로 구성하는 방법

// HttpServlet 을 상속받는 클래스로 설계 → Servlet

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{
	
	
	private static final long serialVersionUID = 1L;

	// 사용자 HTTP 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식의 요청에 대해 처리하는 코드
		doGetPost(request, response);
	}
	
	// 사용자 HTTP 프로토콜 요청이 POST 방식일 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// POST 방식의 요청에 대해 처리하는 코드
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Get 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리하는 사용자정의 메소드
		
		// request 요청 객체
		// → 클라이언트로부터 서버로.. 전송된 데이터 객체
		// request 객체에 대한 세팅 → 인코딩 방식 처리 → 한글 깨짐 방지
		// response 응답 객체
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		String str = "아이디 : " + id + ", 패스워드 : " + pwd;
		
		PrintWriter out = response.getWriter();
				
		out.write("<!DOCTYPE html>");		
		out.write("<html>");		
		out.write("<head>");		
		out.write("<meta charset=\"UTF-8\">");		
		out.write("<title>Test005.java</title>");		
		out.write("</head>");		
		out.write("<body>");		
		out.write("");		
		out.write("<div>");		
		out.write("	<h1>서블릿 관련 실습</h1>");		
		out.write("	<hr>");		
		out.write("</div>");		
		out.write("");		
		out.write("<div>");		
		out.write("	<h2>HttpServlet 클래스를 활용한 서블릿 태스트</h2>");		
		out.write("	");		
		out.write("	<p>" + str + "</p>");		
		out.write("</div>");		
		out.write("</body>");		
		out.write("</html>");		
	}
}
