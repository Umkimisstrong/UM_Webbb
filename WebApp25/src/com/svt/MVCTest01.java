/*
  MVCTest01.java
*/
package com.svt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCTest01 extends HttpServlet
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
	   
	   // 1 부터 100 까지의 수를 객체(컬렉션)에 저장하는 과정
	   List<String> lists = new ArrayList<String>();
	   for(int i =1; i<=100; i++)
		   lists.add(String.valueOf(i));
	   
	   request.setAttribute("lists", lists);
	   
	   RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/MVCTest01.jsp");
	   dispatcher.forward(request, response);
	   
	   
	   
   }
}