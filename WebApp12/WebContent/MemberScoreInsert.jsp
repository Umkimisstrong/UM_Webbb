<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreInsert.jsp
	String sid = request.getParameter("sid");
	int kor = Integer.parseInt(request.getParameter("uKor"));
	int eng = Integer.parseInt(request.getParameter("uEng"));
	int mat = Integer.parseInt(request.getParameter("uMat"));
	
	MemberScoreDAO dao = new MemberScoreDAO();
	try
	{
		dao.connection();
		MemberScoreDTO dto = new MemberScoreDTO();
		
		dto.setSid(sid);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		dao.add(dto);
		
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