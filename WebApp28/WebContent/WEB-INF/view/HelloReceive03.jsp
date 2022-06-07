<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloReceive03.jsp</h2>
	<hr />
</div>

<div>
	<ul>
		<li><b>FirstName : </b>${param.firstName }</li>
		<li><b>LastName : </b>${param.lastName }</li>
	</ul>

</div>

</body>
</html>