package com.test.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
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
		   response.setContentType("text/html; charset=UTF-8 "); 
		   
		   PrintWriter out = response.getWriter();
		   String title = "결과수신페이지";
		   String subTitle="HelloReceive02.java";
		   String docType="<!DOCTYPE html>";
		   
		   out.print(docType +"\n"
				   + "<html>\n"
				   + "<head><title>" + title + "</title></head>\n"
				   + "<body bgcolor=\"f0f0f0\">\n"
				   + "<div><h1>" + title + "</h1>\n"
				   + "<h2>" + subTitle + "</h2>\n"
				   + "<hr></div>\n"
				   + "<div>\n"
				   + "<ul>\n"
				   + "<li><b>First Name : </b>" + request.getParameter("firstName") + "</li>\n"
		           + "<li><b>last Name : </b>" + request.getParameter("lastName") + "</li>\n"
		           + "</ul>\n"
		           + "</div>\n"
		           + "</body>\n"
		           + "</html>\n");
		   
	   }
	}