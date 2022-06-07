/*
  Test2.java
*/
package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		// 이전 페이지(Test2.jsp)로부터 데이터 (name, age) 수신
		
		// 한글 깨짐 방지 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수신
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// 업무 처리
		String str = "이름은" + name + "이며. 나이는 " + age + "세 입니다.";
		
		// 처리한 업무 넘기기
		request.setAttribute("result", str);
		// 포워딩 하는 페이지에 값을 넘기기 위한 준비(설정)
		// 즉, str 값을 result 라는 이름으로 Test2_result.jsp 페이지로 넘길 준비
		
		// 포워딩
		RequestDispatcher rd = request.getRequestDispatcher("/Test2_result.jsp");
		rd.forward(request, response);
		
	}
}
