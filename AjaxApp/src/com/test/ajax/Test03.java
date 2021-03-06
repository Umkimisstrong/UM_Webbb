/*
 Test03.java
*/
package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

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
	   request.setCharacterEncoding("UTF-8");
	   
	   
	   // 데이터 수신
	   String id = request.getParameter("id");
	   
	   // 본래 업무 수행 과정
	   // id 가 hch 일 경우...
	   // Model → DB 액션 처리 요청 → DAO (처리요청) 
	   //                               --------------
	   //                               DTO, Connection 활용
	   //               SELECT COUNT(*) AS COUNT	   
	   //            → FROM MEMBER WHERE ID = 'hch';
	   //               수신처리 → id는 1 or 0 ( 통상적으로 id 는 primary 키)
	   
	   // -------------------------------------------------------------------------
	   
	   // ※ db 대신 자료구조
	   ArrayList<String> db = new ArrayList<String>();
	   db.add("superman");
	   db.add("batman");
	   db.add("admin");
	   
	   int result = 0;
	   
	   for (String item : db)
	   {
		   if (item.equals(id))
		   {
			   result = 1;
		   }
	   }
		   
	   
	   // 최종 result 에 1이 남아있으면...         이미 존재하는 id → 사용 불가
	   // 1로 바뀌지 않으면 0이 계속 남아있으면 .. 존재하지 않는 id → 사용 가능
	   
	   // 이 최종 result 값을 돌려주기 위해 조각 데이터를 view 에 넘긴다.
	   request.setAttribute("result", result);
	   RequestDispatcher dispatcher = request.getRequestDispatcher("Test03Ok.jsp");
	   dispatcher.forward(request, response);
   }
}