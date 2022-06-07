<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>

<%
	// Created_ok.jsp
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String recontent = request.getParameter("recontent");
	// IP Address 확인
	// → request.getRemoteAddr(); → 클라이언트의
	dto.setNum(num);
	dto.setRes(recontent);
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.insertRes(dto);
	DBConn.close();
	response.sendRedirect(cp+"/Article.jsp?num="+num+"&pageNum="+pageNum);
%>