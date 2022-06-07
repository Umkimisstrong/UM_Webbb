<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 한글깨짐방지
	request.setCharacterEncoding("UTF-8");

	// 데이터 수신
	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	int result = 0;
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성
		MemberDTO dto = new MemberDTO();
		
		dto.setName(name);
		dto.setTel(tel);
		
		result = dao.add(dto);
		
		if(result < 1)
		{
			response.sendRedirect("Error.jsp");		
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
	
	// URL 주소가 적혀있는 (기록되어 있는) 쪽지를 사용자에게 전달
	// 이주소를 요청해서 찾아가세요
	response.sendRedirect("MemberList.jsp");
	
	// 아래 보여주는 페이지(HTML) 삭제..
%>