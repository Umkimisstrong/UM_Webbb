<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<%
	//Delete_ok.jsp
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	Connection conn = DBConn.getConnection();
	
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	// result 에 따라 분기 처리 가능
	
	DBConn.close();
	
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
%>