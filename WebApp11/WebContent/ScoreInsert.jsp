<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	request.setCharacterEncoding("UTF-8");

	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	int result = 0;
	ScoreDAO dao = null;
	try
	{
		dao = new ScoreDAO();
		
		name = request.getParameter("uName");
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		mat = Integer.parseInt(request.getParameter("mat"));
		
		ScoreDTO dto = new ScoreDTO();
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		result = dao.add(dto);
		if(result<1)
		{
			response.sendRedirect("Error.jsp;");
		}
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
	
	response.sendRedirect("ScoreList.jsp");
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
%>