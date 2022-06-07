package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
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
		   
			
			int su1 = Integer.parseInt(request.getParameter("su1"));
			int su2 = Integer.parseInt(request.getParameter("su2"));
			String oper = request.getParameter("oper");
			
			String result = "";
			
			if (oper.equals("add"))
				result = String.format("%d + %d = %d" , su1, su2, (su1+su2));
			else if (oper.equals("sub")) 
				result = String.format("%d - %d = %d" , su1, su2, (su1-su2));
			else if (oper.equals("mul")) 
				result = String.format("%d * %d = %d" , su1, su2, (su1*su2));
			else if (oper.equals("div")) 
				result = String.format("%d / %d = %d" , su1, su2, ((double)su1/su2));
		   
			request.setAttribute("result", result);
			
		   RequestDispatcher dispatcher = request.getRequestDispatcher("LoadTest03_ok.jsp");
		   dispatcher.forward(request, response);
		   
	   }
}
