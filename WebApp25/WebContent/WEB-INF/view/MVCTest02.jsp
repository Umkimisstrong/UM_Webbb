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
<title>MVCTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- Model - controller - view -->

<div>
	<h1>MVC 관련 실습3</h1>
	<hr />
</div>

<div>
	<ul>
		<c:forEach var="num" items="${lists }">
			<li>
				${num }
			</li>
		</c:forEach>
	</ul>
</div>




</body>
</html>