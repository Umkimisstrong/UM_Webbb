<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberUpdate
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	try
	{
		dao.connection();
		MemberDTO dto = new MemberDTO();
		dto.setSid(sid);
		dto.setName(uName);
		dto.setTel(uTel);
		
		dao.modify(dto);
		// 이후 반환 결과에 따른 분기 처리 가능~!!
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
	
	// 클라이언트에 MemberSelect.jsp를 다시 요청할 수 있도록 안내~!!
	response.sendRedirect("MemberSelect.jsp");
	
%>