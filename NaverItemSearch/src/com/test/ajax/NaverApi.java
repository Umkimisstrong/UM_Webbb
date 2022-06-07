package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NaverApi extends HttpServlet
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
		   String name = request.getParameter("name");
			
		   String result = "";
			
		  // System.out.println(name);
		   
		   result = ApiExamSearchBlog.search(name);
		   
		   request.setAttribute("result", result);
			
		   //System.out.println(result);
		   
		   RequestDispatcher dispatcher = request.getRequestDispatcher("search_ok.jsp");
		   dispatcher.forward(request, response);
		   
	   }
}

