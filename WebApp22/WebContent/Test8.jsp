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
<title>Test8.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) choose 문 실습</h1>
	<h2>배수 확인하기</h2>
	<hr />
</div>


<div>
	<form action="" method="post">
		정수 <input type="text" name="su" class="txt" /> <br />
		
		<button type="submit" class="btn">결과 확인</button> 
	</form>
</div>

<br /><br />


<!-- choose 문 : else 가 없는 if 문에서
                 else 가 사용되는 것 처럼 ....(사용빈도 多) -->


<div>
	<c:if test="${!empty param.su}">
		<%-- ${param.su } --%>
		<%-- <c:choose></c:choose> --%>
		<%-- JSTL Core 에서 if~else 를 대신할 수 있는 구문 --%>
		<c:choose>
			<c:when test="${param.su % 3 == 0 && param.su % 4 == 0 }">
				<p>${param.su }은(는) 3과 4의 배수 ~ !!!</p>			
			</c:when>
			<c:when test="${param.su % 3 == 0}">
				<p>${param.su }은(는) 3의 배수 ~ !!!</p>			
			</c:when>
			<c:when test="${param.su % 4 == 0 }">
				<p>${param.su }은(는) 4의 배수 ~ !!!</p>			
			</c:when>
			
			<%-- else --%>
			<c:otherwise>
				<p>${param.su }은(는) 3 또는 4의 배수가 아님 ~ !!!</p>
			</c:otherwise>
			
			
		</c:choose>
		
		
	</c:if>
</div>


</body>
</html>