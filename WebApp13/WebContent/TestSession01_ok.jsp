<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//TestSession01_ok.jsp
	// 이전페이지 TestSession01.jsp 넘어온 데이터 userId, userPwd
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String memberId = "superman";
	String memberPwd = "123456";
	String memberName = "홍은혜";
	
	if(userId.equals(memberId)&& userPwd.equals(memberPwd))
	{
		session.setAttribute("userId", userId);
		session.setAttribute("userName", memberName);
		
		response.sendRedirect("TestSession01.jsp");
		
	}
%>
<h1>로그인 실패~!!!</h1>
<a href="TestSession01.jsp">로그인 페이지로 돌아가기</a>