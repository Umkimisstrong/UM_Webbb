<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//Logout.jsp
	
	session.removeAttribute("userId");
	session.removeAttribute("userPwd");
	session.removeAttribute("userName");
	// 사용자 아이디 패스워드 삭제
	
	// 클라이언트에게 다시 로그인 페이지 요청할 수 있도록
	response.sendRedirect("TestSession01.jsp");
%>