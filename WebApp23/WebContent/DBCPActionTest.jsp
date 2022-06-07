<%@page import="com.util.DBCPConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();

	String msg = "";
	
	if(conn!=null)
	{
		msg = "데이터베이스 연결 성공~!";
	}
	else
		msg = "데이터베이스 연결 실패~!"; 
	
	DBCPConn.close();
	
	// web.xml 건드리고 서버 리스타트 안하면 로딩 안될때도 있음.....

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPActionTest.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>DBCP를 활용한 데이터베이스 접속 실습</h1>
	<hr />
</div>

<div>
	<!-- 결과 확인 -->
	<h2><%=msg %></h2>
	<!--  데이터베이스 연결 성공~! -->
</div>















</body>
</html>