<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberInsert.jsp
	// 테이블에 회원데이터 추가 액션 처리..
	// 이후 다시 리스트페이지 MemberSelect.jsp 요청
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→ add()메소드 호출 위해 필요 )
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 dao의 add()메소드 호출
		dao.add(member);	
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
	// check~!!
	// 클라이언트가 MemberSelect.jsp 페이지를 다시요청할 수 있도록 안내
	response.sendRedirect("MemberSelect.jsp");
	
%>