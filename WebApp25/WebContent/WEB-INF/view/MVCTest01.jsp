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
<title>MVCTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- controller - view -->

<div>
	<h1>MVC관련 실습 2</h1>
	<hr />
</div>

<div>
	<!-- 1부터 100까지의 결과물을 가지고 클라이언트 만나기 -->
	<!-- 컨트롤러로부터 수신한 결과 -->
	<ul>
		<c:forEach var="i" items="${lists }">
			<li>${i }</li>
		</c:forEach>
	</ul>
</div>

</body>
</html>