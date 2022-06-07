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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<div>
	<h1>JSTL 코어(Core)를 활용한 회원 정보 입력</h1>
	<hr />
</div>

<div>

	<form action="MemberInsert.jsp">
	
		<!-- (이름, 전화번호, 주소) * 5명 분  -->
		<!-- → submit 액션 처리 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<c:forEach var="num" begin="1" end="5" step="1">
					<c:set var="name" value="name" ></c:set>
					<c:set var="name" value="${name }${num }"></c:set>
					<input type="text" name="${name }" class="txt">
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<c:forEach var="num" begin="1" end="5" step="1">
					<c:set var="tel" value="tel"></c:set>
					<c:set var="tel" value="${tel }${num }"></c:set>
					<input type="text" name="${tel }" class="txt">
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
				
				<c:forEach var="num" begin="1" end="5" step="1">
					<c:set var="addr" value="addr"></c:set>
					<c:set var="addr" value="${addr }${num }"></c:set>
					<input type="text" name="${addr }" class="txt">
					</c:forEach>
				</td>
			</tr>
		</table>
		<button type="submit" class="btn">입력</button>
	</form>
</div>



</body>
</html>