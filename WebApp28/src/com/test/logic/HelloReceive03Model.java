/* ◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
	HelloRecieve03Model.java 
◆◆◆◆◆◆◆◆◆◆◆◆◆◆ */

package com.test.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수신
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 추가적인 업무 처리 삽입
		lastName = "[ "+ lastName + " ]"; 
		
		// 수신된 데이터를 컨트롤 하는 것 가능
		// ex) if firstName ==""  .. 등등
		
		// 데이터 전달
		/*
		  request.setAttribute("firstName", firstName);
		  request.setAttribute("lastName", lastName);
		 */
		
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
}
