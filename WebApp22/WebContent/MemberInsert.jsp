<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//MemberInsert.jsp
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//                      MemberDTO
	// MemberList.jsp 를 요청할 수 있도록 안내
	List<MemberDTO> memList = new ArrayList<MemberDTO>();
	MemberDTO dto = null;
	
	try
	{
		for(int i = 1; i <= 5; i ++)
		{
			dto = new MemberDTO(request.getParameter("name"+i)
					          , request.getParameter("tel"+i)
					          , request.getParameter("addr"+i));
			memList.add(dto);
		}
		
		request.setAttribute("memList", memList);
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>

<!-- setAttribute() 메소드는 jsp:forward page="" (포워딩) 이랑 병행사용... 잊지말자 -->
<jsp:forward page="MemberList.jsp"></jsp:forward>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

</body>
</html>