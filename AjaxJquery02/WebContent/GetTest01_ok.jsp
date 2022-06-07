<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	
	String result = "";
	
	if (oper.equals("add"))
		result = String.format("%d + %d = %d" , su1, su2, (su1+su2));
	else if (oper.equals("sub")) 
		result = String.format("%d - %d = %d" , su1, su2, (su1-su2));
	else if (oper.equals("mul")) 
		result = String.format("%d * %d = %d" , su1, su2, (su1*su2));
	else if (oper.equals("div")) 
		result = String.format("%d / %d = %f" , su1, su2, ((double)su1/su2));
%>
<%=result %>