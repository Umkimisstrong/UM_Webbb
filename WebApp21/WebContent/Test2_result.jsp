<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	
	String strMsg = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>
		최종 결과값 수신
	</h1>
	<hr />
</div>

<div>
	<h2><%=strMsg %></h2>
</div>


</body>
</html>