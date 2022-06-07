<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어 (Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>

<div>
	<!-- 5명 회원 명단 출력하기 -->
	<table class="table">
		<c:forEach var="dto" items="${memList }">
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<tr>
				<td>${dto.name }</td>
				<td>${dto.tel }</td>
				<td>${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
	
</div>

</body>
</html>