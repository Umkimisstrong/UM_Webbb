<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	content.replaceAll(" ", "<br>");
	String result = "";
	
	result = String.format("   <p>[%s]</p> %s", title, content);

%>
<%=result%>

<!-- ▶ 이거 써도 됌 -->
<%-- ${param.title} --%> 