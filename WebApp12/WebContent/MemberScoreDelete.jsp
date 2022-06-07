<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreDelete.jsp;
	String sid = request.getParameter("sid");	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		dao.scoreDelete(sid);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();	
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}	
	}

	
	response.sendRedirect("MemberScoreSelect.jsp");
%>