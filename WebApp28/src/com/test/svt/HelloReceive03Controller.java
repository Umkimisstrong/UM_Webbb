package com.test.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.logic.HelloReceive03Model;

public class HelloReceive03Controller  extends HttpServlet
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
		   request.setCharacterEncoding("UTF-8");
		   
		   // Model 객체 연결 → 업무 로직 수행, View 정보 얻어내기
		   HelloReceive03Model model = new HelloReceive03Model();
		   String view = model.process(request, response);
		   
		   // View 객체 연결
		   RequestDispatcher rd = request.getRequestDispatcher(view);
		   rd.forward(request, response);
		   
		   
	   }
}