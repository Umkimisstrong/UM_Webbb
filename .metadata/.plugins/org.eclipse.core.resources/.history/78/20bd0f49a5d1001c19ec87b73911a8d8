<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// AjaxTest03_ok.jsp
	
	response.setContentType("text/xml");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<%
	for(int i =1; i<=2; i++)
	{	
	%>
	<comment num="<%=i %>">
		<title><%=title %></title>
		<content><%=content %></content>
	</comment>
	<%
	}
	%>
</root>