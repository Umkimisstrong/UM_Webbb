/*
  MVCTest02.java
  - Controller 역할을 수행하는 클래스
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

import com.test.MVCTest02Model;

public class MVCTest02 extends HttpServlet
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
	   
	   // 모델 객체 생성 및 모델이 처리한 결과 수신(View 정보 획득)
	   MVCTest02Model model = new MVCTest02Model();
	   String view = model.actionCount(request, response);
	   
	   RequestDispatcher rd = request.getRequestDispatcher(view);
	   rd.forward(request, response);
	   
	   
	   
   }
}